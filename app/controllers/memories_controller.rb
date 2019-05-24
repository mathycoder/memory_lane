require_relative "./application_controller.rb"

class MemoriesController < ApplicationController

  get '/users/:user_id/memories' do
    redirect "/login" if !logged_in?
    if User.ids.include?(params[:user_id].to_i)
      @user = User.find(params[:user_id])
    else
      redirect '/noaccess'
    end

    verify_the_render("memories/index", @user)
  end

  get '/users/:user_id/memories/new' do
    redirect "/login" if !logged_in?
    if User.ids.include?(params[:user_id].to_i)
      @user = User.find(params[:user_id])
    else
      redirect '/noaccess'
    end

    verify_the_user("memories/new", @user)
  end

  post '/users/:user_id/memories' do
    memory = Memory.create(title: params[:memory][:title], location: params[:memory][:location], lane_id: params[:memory][:lane_id])
    date = params[:memory][:date].split("-")
    memory.date = DateTime.new(date[2].to_i,date[0].to_i,date[1].to_i)
    memory.creator_user_id = params[:user_id]
    memory.save

    recollection = Recollection.create
    recollection.user = User.find(params[:user_id])
    recollection.memory = memory
    recollection.anecdote = params[:recollection][:anecdote] if !params[:recollection][:anecdote].empty?
    recollection.joke = params[:recollection][:joke] if !params[:recollection][:joke].empty?
    recollection.quote = params[:recollection][:quote] if !params[:recollection][:quote].empty?
    recollection.save

    flash[:alert] = "New Memory successfully added"
    redirect "/users/#{params[:user_id]}/lanes/#{memory.lane.id}"
  end

  get '/users/:user_id/memories/:memory_id/edit' do
    redirect "/login" if !logged_in?
    if User.ids.include?(params[:user_id].to_i) && Memory.ids.include?(params[:memory_id].to_i)
      @memory = Memory.find(params[:memory_id])
      @user = User.find(params[:user_id])
    else
      redirect '/noaccess'
    end

    verify_the_user("memories/edit", @user)
  end

  patch '/users/:user_id/memories/:memory_id' do
    memory = Memory.find(params[:memory_id])
    memory.title = params[:memory][:title]
    memory.location= params[:memory][:location]
    date = params[:memory][:date].split("-")
    memory.date = DateTime.new(date[2].to_i,date[0].to_i,date[1].to_i)
    memory.save
    flash[:alert] = "Memory edited"
    redirect "/users/#{params[:user_id]}/lanes/#{memory.lane.id}"
  end

  delete '/users/:user_id/memories/:memory_id' do
    memory = Memory.find(params[:memory_id])
    memory.delete
    flash[:alert] = "Memory successfully deleted"
    redirect "/users/#{params[:user_id]}/lanes/#{memory.lane.id}"
  end

end
