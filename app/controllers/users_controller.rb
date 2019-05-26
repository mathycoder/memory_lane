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
    user = User.find(params[:user_id])

    File.delete("./public/#{user.profile_pic_file_path}")
    user.profile_pic_file_path = params[:profile_pic][:filename]
    user.save
    file = params[:profile_pic][:tempfile]
    File.open("./public/#{user.profile_pic_file_path}", 'wb') do |f|
      f.write(file.read)
    end
    flash[:alert] = "Profile image changed"
    redirect "/users/#{user.id}"
  end

  get '/users/:user_id/delete' do
    redirect '/noaccess' if !ids_exist?(params)
    create_instance_variables(params)
    verify_the_user("users/delete")
  end

  delete '/users/:user_id' do
    user = User.find(params[:user_id])
    user.email = ""
    user.save
    redirect '/logout'
  end

  get '/signup' do
    redirect "/users/#{session[:user_id]}" if logged_in?
    erb :'users/create_user'
  end

  post '/signup' do
    if User.find_by(email: params[:user][:email])
      flash[:alert] = "There's already an account registered to that email address"
      redirect '/signup'
    end
    user = User.create(params[:user])
    user.profile_pic_file_path = params[:profile_pic][:filename]
    user.save
    file = params[:profile_pic][:tempfile]
    File.open("./public/#{user.profile_pic_file_path}", 'wb') do |f|
      f.write(file.read)
    end

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
