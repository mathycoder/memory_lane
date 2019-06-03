class ApplicationController < Sinatra::Base
  require 'sinatra/flash'

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    register Sinatra::Flash
    set :session_secret, "cathy"
  end

  get '/' do
    if logged_in?
      redirect "/memories"
    else
      redirect "/login"
    end
  end

  get '/noaccess' do
    erb :'users/noaccess'
  end

  helpers do
    def logged_in?
      !session[:user_id].nil?
    end

    def current_user
      User.find(session[:user_id])
    end

    def users_image?
      if current_user != @image.user
        flash[:alert] = "You don't have permission to delete this photo"
        redirect "/memories"
      end
    end

    def users_memory?
      if !current_user.memories.include?(@memory)
        flash[:alert] = "You don't have permission to add or delete photos to this memory"
        redirect "/memories"
      end
    end

    def user_created_memory_check
      if current_user != @memory.creator
        flash[:alert] = "You don't have permission to edit or delete this memory"
        redirect "/memories"
      end
    end

    def users_recollection?
      if @recollection.user != current_user
        flash[:alert] = "You don't have permission to edit or delete that recollection"
        redirect "/lanes/#{@memory.lane.id}"
      end
    end

    def user_permission?
      # if @user != current_user
      #   flash[:alert] = "You don't have permission to perform this action"
      #   redirect "/users/#{current_user.id}/memories"
      # end
    end

    def new_user?
      redirect "/lanes" if current_user.lanes.empty?
    end

    def all_quotes
      quotes = []
      current_user.lanes.each do |lane|
        lane.recollections.each do |recollection|
          quotes << recollection.quote if !recollection.quote.nil?
        end
      end
      quotes
    end

    def find_previous_and_next
      @memory.images.each_with_index do |image, index|
        if image == @image
          @next = @memory.images[index+1] unless @memory.images[index+1].nil?
          @previous = @memory.images[index-1] unless index == 0
        end
      end
    end

    def all_images_sorted
      images = []
      current_user.memories.each do |memory|
        memory.images.each do |image|
          images << image
        end
      end
      images = images.sort_by{|image| image.timestamp}.reverse
    end

    def recent_images
      images = all_images_sorted()
      images.length > 6? images[0..5] : images
    end

    def all_of_a_users_memories
      memories = []
      current_user.lanes.each do |lane|
        lane.memories.each do |memory|
          memories << memory
        end
      end
      memories
    end

    def recent_memories
      memories = all_of_a_users_memories().sort_by{|memory| memory.timestamp}.reverse
      memories.length > 3? memories[0..2]:memories
    end

    def all_images_find_previous_and_next
      images = all_images_sorted()
      images.each_with_index do |image, index|
        if image == @image
          @next = images[index+1] unless images[index+1].nil?
          @previous = images[index-1] unless index == 0
        end
      end
    end

    def recent_recollections
      recollections = []
      current_user.lanes.each do |lane|
        lane.recollections.each do |recollection|
          recollections << recollection
        end
      end
      recollections = recollections.sort_by{|recollection| recollection.timestamp}.reverse
      if recollections.length > 4
        recollections[0..3]
      else
        recollections
      end
    end

    def verify_the_user(view_to_render)
      if logged_in?
        erb :"#{view_to_render}"
      else
        redirect '/login'
      end
    end

    def created_memory?
      @memory.creator == current_user
    end

    def part_of_memory?
      @memory.lane.users.include?(current_user)
    end

    def my_recollection?
      @recollection.user == current_user
    end

    def ids_exist?(params)
      params.all? do |key, value|
        if key.include?("id")
          the_class = Object.const_get(key.split("_").first.capitalize)
          the_class.ids.include?(value.to_i)
        else
          true
        end
      end
    end

    def create_instance_variables(params)
      params.each do |key, value|
        if key.include?("id")
          the_class = key.split("_").first
          instance_variable_set("@#{the_class}", Object.const_get(the_class.capitalize).find(value))
        end
      end
    end
  end
end
