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
    redirect "/users/#{params[:user_id]}/lanes/#{memory.lane.id}"
  end
end
