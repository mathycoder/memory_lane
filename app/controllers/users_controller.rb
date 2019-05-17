require_relative "./application_controller.rb"

class UsersController < ApplicationController

  get '/users/:user_id' do
    @user = User.find(params[:user_id])
    erb :'users/show'
  end
end
