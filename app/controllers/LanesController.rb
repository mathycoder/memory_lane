require_relative "./application_controller.rb"

class LanesController < ApplicationController

  get '/users/:user_id/lanes' do
    @user = User.find(params[:user_id])
    erb :'lanes/index'
  end

  get '/users/:user_id/lanes/:lane_id' do
    @user = User.find(params[:user_id])
    @lane = Lane.find(params[:lane_id])
    erb :'lanes/show'
  end


end
