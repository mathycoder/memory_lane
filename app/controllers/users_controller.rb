require_relative "./application_controller.rb"

class UsersController < ApplicationController

  get '/users/:user_id' do
    @user = User.find(params[:user_id])
    erb :'users/show'
  end

  get '/signup' do
  # if logged_in?
  #   redirect '/tweets'
  # end

  erb :'users/create_user'
  end

  post '/signup' do
    if params[:name].empty? || params[:email].empty? || params[:password].empty?
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
    redirect "/users/#{user.id}"
  end

  get '/login' do
    if logged_in?
      redirect "/users/#{sessions[:user_id]}"
    end

    erb :'users/login'
  end

  post '/login' do
    user = User.find_by(email: params[:email])
    session[:user_id] = user.id

    redirect "/users/#{user.id}"
  end

end
