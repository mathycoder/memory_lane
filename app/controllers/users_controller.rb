require_relative "./application_controller.rb"

class UsersController < ApplicationController

  get '/users/:user_id' do
    if User.ids.include?(params[:user_id].to_i)
      @user = User.find(params[:user_id])
    else
      redirect '/noaccess'
    end

    if current_user == @user
      erb :'users/show'
    else
      erb :'users/noaccess'
    end
  end

  get '/signup' do

    if logged_in?
      redirect "/users/#{session[:user_id]}"
    end

    erb :'users/create_user'
  end

  post '/signup' do
    user = User.create(params[:user])
    user.profile_pic_file_path = params[:profile_pic][:filename]
    user.save
    file = params[:profile_pic][:tempfile]
    File.open("./public/#{user.profile_pic_file_path}", 'wb') do |f|
      f.write(file.read)
    end

    session[:user_id] = user.id
    redirect "/users/#{user.id}"
  end

  get '/login' do
    if logged_in?
      redirect "/users/#{session[:user_id]}"
    end

    erb :'users/login'
  end

  post '/login' do
    user = User.find_by(email: params[:email]).authenticate(params[:password])
    session[:user_id] = user.id

    redirect "/users/#{user.id}"
  end

  get '/logout' do
    session.clear
    redirect '/login'
  end

end
