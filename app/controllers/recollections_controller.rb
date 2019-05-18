require_relative "./application_controller.rb"

class RecollectionsController < ApplicationController

  get '/users/:user_id/memories/:memory_id/recollections/new' do
    @memory = Memory.find(params[:memory_id])
    @user = User.find(params[:user_id])
    erb :'recollections/new'
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
    erb :'recollections/edit'
  end

  patch '/users/:user_id/memories/:memory_id/recollections/:recollection_id' do
    recollection = Recollection.find(params[:recollection_id])
    recollection.update(params[:recollection])
    memory = Memory.find(params[:memory_id])
    redirect "/users/#{params[:user_id]}/lanes/#{memory.lane.id}"
  end

end


#{}"users/<%=@user.id%>/<%=memory.id%>/recollections/new"
