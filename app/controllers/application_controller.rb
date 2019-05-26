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
      redirect "/users/#{current_user.id}"
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

    def all_images_find_previous_and_next
    end

    def find_previous_and_next
      @memory.images.each_with_index do |image, index|
        if image == @image
          @next = @memory.images[index+1] unless @memory.images[index+1].nil?
          @previous = @memory.images[index-1] unless index == 0
        end
      end
    end

    def recent_images
      images = []
      @user.memories.each do |memory|
        memory.images.each do |image|
          images << image
        end
      end
      images = images.sort_by{|image| image.timestamp}.reverse
      if images.length > 6
        images[0..5]
      else
        images
      end
    end

    def recent_recollections
      recollections = []
      @user.lanes.each do |lane|
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
      if logged_in? && current_user == @user
        erb :"#{view_to_render}"
      elsif logged_in? && current_user != @user
        erb :'users/noaccess'
      else
        redirect '/login'
      end
    end

    def created_memory?
      @memory.creator == @user
    end

    def part_of_memory?
      @memory.lane.users.include?(@user)
    end

    def my_recollection?
      @recollection.user == @user
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
