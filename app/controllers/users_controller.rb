require_relative "./application_controller.rb"
require 'sinatra/flash'

class UsersController < ApplicationController

  get '/users/:user_id' do
    redirect '/noaccess' if !ids_exist?(params)
    create_instance_variables(params)
    verify_the_user("users/show")
  end

  get '/users/:user_id/edit' do
    redirect '/noaccess' if !ids_exist?(params)
    create_instance_variables(params)
    verify_the_user("users/edit")
  end

  patch '/users/:user_id' do
    create_instance_variables(params)
    user_permission?()

    File.delete("./public/#{current_user.profile_pic_file_path}")
    current_user.profile_pic_file_path = params[:profile_pic][:filename]
    current_user.save
    file = params[:profile_pic][:tempfile]
    File.open("./public/#{user.profile_pic_file_path}", 'wb') do |f|
      f.write(file.read)
    end
    flash[:alert] = "Profile image changed"
    redirect "/users/#{current_user.id}"
  end

  get '/users/:user_id/delete' do
    redirect '/noaccess' if !ids_exist?(params)
    create_instance_variables(params)
    verify_the_user("users/delete")
  end

  delete '/users/:user_id' do
    create_instance_variables(params)
    user_permission?()

    user.email = ""
    user.save
    redirect '/logout'
  end

  get '/signup' do
    redirect "/users/#{session[:user_id]}" if logged_in?
    erb :'users/create_user'
  end

  post '/signup' do
    if params[:user][:name].empty?
      flash[:alert] = "Please enter your name"
      redirect '/signup'
    elsif params[:user][:email].empty?
      flash[:alert] = "Please enter an email address"
      redirect '/signup'
    elsif params[:user][:password].empty?
      flash[:alert] = "Please enter a password"
      redirect '/signup'
    end

    if User.find_by(email: params[:user][:email])
      flash[:alert] = "There's already an account registered to that email address"
      redirect '/signup'
    end
    user = User.create(params[:user])
    if params.include?(:profile_pic)
      user.profile_pic_file_path = params[:profile_pic][:filename]
      file = params[:profile_pic][:tempfile]
      File.open("./public/#{user.profile_pic_file_path}", 'wb') do |f|
        f.write(file.read)
      end
    else
      user.profile_pic_file_path = "silhouette.PNG"
    end
    user.save
    session[:user_id] = user.id
    redirect "/users/#{user.id}/lanes"
  end

  get '/login' do
    redirect "/users/#{session[:user_id]}" if logged_in?
    erb :'users/login'
  end

  post '/login' do
    user = User.find_by(email: params[:email])
    if !user
      flash[:alert] = "There's no user with that email address"
      redirect '/login'
    end

    if !user.authenticate(params[:password])
      flash[:alert] = "The password you entered is incorrect"
      redirect '/login'
    end

    session[:user_id] = user.id
    redirect "/users/#{user.id}/memories"
  end

  get '/logout' do
    session.clear
    redirect '/login'
  end

end
