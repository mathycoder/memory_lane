require_relative "./application_controller.rb"

class LanesController < ApplicationController

  get '/users/:user_id/lanes' do

    if User.ids.include?(params[:user_id].to_i)
      @user = User.find(params[:user_id])
    else
      redirect '/noaccess'
    end

    #repeated code
    if logged_in? && current_user == @user
      erb :'lanes/index'
    elsif logged_in? && current_user != @user
      erb :'users/noaccess'
    else
      redirect '/login'
    end
  end

  get '/users/:user_id/lanes/new' do
    if User.ids.include?(params[:user_id].to_i)
      @user = User.find(params[:user_id])
    else
      redirect '/noaccess'
    end

    if logged_in? && current_user == @user
      @users = User.alphabetize
      erb :'lanes/new'
    elsif logged_in? && current_user != @user
      erb :'users/noaccess'
    else
      redirect '/login'
    end
  end

  post '/users/:user_id/lanes' do
    @user = User.find(params[:user_id])
    lane = Lane.create()
    lane.users << @user
    params[:users].each do |user_id|
      user = User.find(user_id)
      lane.users << user
    end
    lane.save

    redirect "/users/#{@user.id}/lanes/#{lane.id}"
  end


  get '/users/:user_id/lanes/:lane_id' do

    if User.ids.include?(params[:user_id].to_i) && Lane.ids.include?(params[:lane_id].to_i)
      @user = User.find(params[:user_id])
      @lane = Lane.find(params[:lane_id])
    else
      redirect '/noaccess'
    end

    #repeated code...
    if logged_in? && current_user == @user
      erb :'lanes/show'
    elsif logged_in? && current_user != @user
      erb :'users/noaccess'
    else
      redirect '/login'
    end
  end

  post '/users/:user_id/lanes/jumpto' do
    user = User.find(params[:user_id])

    if params[:lane] == "new_lane"
      redirect "/users/#{user.id}/lanes/new"
    else
      lane = Lane.find(params[:lane])
      redirect "/users/#{user.id}/lanes/#{lane.id}"
    end
  end

end
