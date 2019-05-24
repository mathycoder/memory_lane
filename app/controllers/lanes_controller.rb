require_relative "./application_controller.rb"

class LanesController < ApplicationController

  get '/users/:user_id/lanes' do
    redirect '/noaccess' if !id_exists?(params[:user_id], User)
    # @user = User.find(params[:user_id])
    create_instance_variables(params)
    verify_the_user("lanes/index")
  end

  get '/users/:user_id/lanes/new' do
    redirect '/noaccess' if !id_exists?(params[:user_id], User)
    @user = User.find(params[:user_id])
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
    redirect '/noaccess' if !id_exists?(params[:user_id], User) || !id_exists?(params[:lane_id], Lane)
    create_instance_variables(params)
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
