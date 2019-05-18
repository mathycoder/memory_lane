require_relative "./application_controller.rb"

class MemoriesController < ApplicationController

  get '/users/:user_id/memories' do
    @user = User.find(params[:user_id])
    erb :'memories/index'
  end

  get '/users/:user_id/memories/new' do
    @user = User.find(params[:user_id])
    erb :'memories/new'
  end

  post '/users/:user_id/memories' do
    memory = Memory.create(params[:memory])
    memory.creator_user_id = params[:user_id]
    memory.save

    recollection = Recollection.create
    recollection.user = User.find(params[:user_id])
    recollection.memory = memory
    recollection.anecdote = params[:recollection][:anecdote] if !params[:recollection][:anecdote].empty?
    recollection.joke = params[:recollection][:joke] if !params[:recollection][:joke].empty?
    recollection.quote = params[:recollection][:quote] if !params[:recollection][:quote].empty?
    recollection.save

    redirect "/users/#{params[:user_id]}/lanes/#{memory.lane.id}"
  end
end
