require_relative "./application_controller.rb"

class RecollectionsController < ApplicationController

  get '/users/:user_id/memories/:memory_id/recollections/new' do
    @memory = Memory.find(params[:memory_id])
    @user = User.find(params[:user_id])

    #repeated code...
    if logged_in? && current_user == @user
      erb :'recollections/new'
    elsif !logged_in?
      redirect :'/login'
    else
      erb :'users/noaccess'
    end

  end

  post '/users/:user_id/memories/:memory_id/recollections' do
    recollection = Recollection.create
    recollection.user = User.find(params[:user_id])

    memory = Memory.find(params[:memory_id])
    recollection.memory = memory
    recollection.anecdote = params[:recollection][:anecdote] if !params[:recollection][:anecdote].empty?
    recollection.joke = params[:recollection][:joke] if !params[:recollection][:joke].empty?
    recollection.quote = params[:recollection][:quote] if !params[:recollection][:quote].empty?
    recollection.save

    redirect "/users/#{params[:user_id]}/lanes/#{memory.lane.id}"
  end

  get '/users/:user_id/memories/:memory_id/recollections/:recollection_id/edit' do
    @recollection = Recollection.find(params[:recollection_id])
    @user = @recollection.user
    @memory = @recollection.memory

    #first if statement is a bit different; the rest is repeated code
    if logged_in? && current_user == User.find(params[:user_id])
      erb :'recollections/edit'
    elsif !logged_in?
      redirect :'/login'
    else
      erb :'users/noaccess'
    end

  end

  patch '/users/:user_id/memories/:memory_id/recollections/:recollection_id' do
    recollection = Recollection.find(params[:recollection_id])
    #recollection.update(params[:recollection])

    recollection.anecdote = params[:recollection][:anecdote]
    recollection.anecdote = nil if recollection.anecdote.empty?
    recollection.joke = params[:recollection][:joke]
    recollection.joke = nil if recollection.joke.empty?
    recollection.quote = params[:recollection][:quote]
    recollection.quote = nil if recollection.quote.empty?

    recollection.save
    memory = Memory.find(params[:memory_id])
    redirect "/users/#{params[:user_id]}/lanes/#{memory.lane.id}"
  end

  delete '/users/:user_id/memories/:memory_id/recollections/:recollection_id' do
    recollection = Recollection.find(params[:recollection_id])
    memory = Memory.find(params[:memory_id])
    recollection.delete
    redirect "/users/#{params[:user_id]}/lanes/#{memory.lane.id}"
  end



end


#{}"users/<%=@user.id%>/<%=memory.id%>/recollections/new"
