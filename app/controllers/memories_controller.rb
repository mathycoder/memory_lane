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
    binding.pry
  end
end
