require_relative "./application_controller.rb"

class ImagesController < ApplicationController

  get '/users/:user_id/memories/:memory_id/images/new' do
    @user = User.find(params[:user_id])
    @memory = Memory.find(params[:memory_id])
    erb :'images/new'
  end

  post '/users/:user_id/memories/:memory_id/images' do
    image = Photo.create()
    image.user = User.find(params[:user_id])
    memory = Memory.find(params[:memory_id])
    image.memory = memory
    image.file_path = params[:file][:filename]
    image.save
    file = params[:file][:tempfile]
    File.open("./public/#{image.file_path}", 'wb') do |f|
      f.write(file.read)
    end
    redirect "/users/#{params[:user_id]}/lanes/#{memory.lane.id}"
  end

  get '/users/:user_id/memories/:memory_id/images/:image_id' do
    @image = Photo.find(params[:image_id])
    @memory = Memory.find(params[:memory_id])
    erb :'images/show'
  end

  delete '/users/:user_id/memories/:memory_id/images/:image_id' do
    image = Photo.find(params[:image_id])
    memory = Memory.find(params[:memory_id])
    File.delete("./public/#{image.file_path}")
    image.delete
    redirect "/users/#{params[:user_id]}/lanes/#{memory.lane.id}"
  end


end
