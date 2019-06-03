require_relative "./application_controller.rb"

class LanesController < ApplicationController

  get '/lanes' do
    redirect '/noaccess' if !ids_exist?(params)
    create_instance_variables(params)
    verify_the_user("lanes/index")
  end

  get '/lanes/new' do
    redirect '/noaccess' if !ids_exist?(params)
    create_instance_variables(params)
    @users = User.alphabetize
    verify_the_user("lanes/new")
  end

  post '/lanes' do
    create_instance_variables(params)
    user_permission?()
    if !params.include?(:users)
      flash[:alert] = "Please include at least one other user"
      redirect "/users/#{current_user.id}/lanes/new"
    end
    users = params[:users].map {|user_id| User.find(user_id)}
    users << current_user

    if current_user.lanes.none?{|lane| lane.users.sort == users.sort}
      lane = Lane.create()
      lane.users << users
      lane.save
      flash[:alert] = "Lane successfully created"
    else
      lane = current_user.lanes.find{|lane| lane.users.sort == users.sort}
      flash[:alert] = "That lane already exists"
    end

    redirect "/lanes/#{lane.id}"
  end


  get '/lanes/:lane_id' do
    redirect '/noaccess' if !ids_exist?(params)
    create_instance_variables(params)
    verify_the_user("lanes/show")
  end

  post '/lanes/jumpto' do
    create_instance_variables(params)
    user_permission?()

    if params[:lane] == "new_lane"
      redirect "/lanes/new"
    elsif params[:lane] == "Your Lanes"
      redirect "/lanes"
    else
      lane = Lane.find(params[:lane])
      redirect "/lanes/#{lane.id}"
    end
  end

end
