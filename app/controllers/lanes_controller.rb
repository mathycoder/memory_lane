require_relative "./application_controller.rb"

class LanesController < ApplicationController

  get '/users/:user_id/lanes' do
    if User.ids.include?(params[:user_id].to_i)
      @user = User.find(params[:user_id])
    else
      redirect '/noaccess'
    end

    verify_the_user("lanes/index")
  end

  get '/users/:user_id/lanes/new' do
    if User.ids.include?(params[:user_id].to_i)
      @user = User.find(params[:user_id])
    else
      redirect '/noaccess'
    end

    @users = User.alphabetize
    verify_the_user("lanes/new")
  end

  post '/users/:user_id/lanes' do
    @user = User.find(params[:user_id])

    users = []
    users = params[:users].map {|user_id| User.find(user_id)}
    users << @user

    if @user.lanes.none?{|lane| lane.users.sort == users.sort}
      lane = Lane.create()
      lane.users << users
      lane.save
      flash[:alert] = "Lane successfully created"
    else
      lane = @user.lanes.find{|lane| lane.users.sort == users.sort}
      flash[:alert] = "That lane already exists"
    end

    redirect "/users/#{@user.id}/lanes/#{lane.id}"
  end


  get '/users/:user_id/lanes/:lane_id' do
    if User.ids.include?(params[:user_id].to_i) && Lane.ids.include?(params[:lane_id].to_i)
      @user = User.find(params[:user_id])
      @lane = Lane.find(params[:lane_id])
    else
      redirect '/noaccess'
    end

    verify_the_user("lanes/show")
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
