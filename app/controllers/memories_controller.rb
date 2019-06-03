require_relative "./application_controller.rb"

class MemoriesController < ApplicationController

  get '/memories' do
    redirect '/noaccess' if !ids_exist?(params)
    new_user?()
    @recent_images = recent_images()
    @recent_recollections = recent_recollections()
    @all_quotes = all_quotes()
    @recent_memories = recent_memories()
    verify_the_user("memories/index")
  end

  get '/memories/new' do
    redirect '/noaccess' if !ids_exist?(params)
    verify_the_user("memories/new")
  end

  post '/memories' do
    memory = Memory.create(title: params[:memory][:title], location: params[:memory][:location], lane_id: params[:memory][:lane_id])
    date = params[:memory][:date].split("-")
    memory.date = DateTime.new(date[2].to_i,date[0].to_i,date[1].to_i)
    memory.creator_user_id = current_user.id
    memory.timestamp = DateTime.now
    memory.save

    flash[:alert] = "New Memory successfully added"
    redirect "/lanes/#{memory.lane.id}"
  end

  get '/memories/:memory_id/edit' do
    redirect '/noaccess' if !ids_exist?(params)
    create_instance_variables(params)
    redirect '/noaccess' if !created_memory?
    verify_the_user("memories/edit")
  end

  patch '/memories/:memory_id' do
    create_instance_variables(params)
    user_created_memory_check()
    @memory.title = params[:memory][:title]
    @memory.location= params[:memory][:location]
    date = params[:memory][:date].split("-")
    @memory.date = DateTime.new(date[2].to_i,date[0].to_i,date[1].to_i)
    @memory.save
    flash[:alert] = "Memory edited"
    redirect "/lanes/#{@memory.lane.id}"
  end

  delete '/memories/:memory_id' do
    create_instance_variables(params)
    user_created_memory_check()
    @memory.delete
    flash[:alert] = "Memory successfully deleted"
    redirect "/lanes/#{@memory.lane.id}"
  end

end
