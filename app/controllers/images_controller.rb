require_relative "./application_controller.rb"

class ImagesController < ApplicationController

  get '/users/:user_id/memories/:memory_id/images/new' do
    if User.ids.include?(params[:user_id].to_i) && Memory.ids.include?(params[:memory_id].to_i)
      @memory = Memory.find(params[:memory_id])
      @user = User.find(params[:user_id])
    else
      redirect '/noaccess'
    end
    verify_the_memory()
    verify_the_user("images/new")
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
    flash[:alert] = "Photo successfully added to Memory"
    redirect "/users/#{params[:user_id]}/lanes/#{memory.lane.id}"
  end

  get '/users/:user_id/memories/:memory_id/images/:image_id' do
    if Photo.ids.include?(params[:image_id].to_i) && Memory.ids.include?(params[:memory_id].to_i) && User.ids.include?(params[:user_id].to_i)
      @image = Photo.find(params[:image_id])
      @memory = Memory.find(params[:memory_id])
      @user = User.find(params[:user_id])
    else
      redirect '/noaccess'
    end
    verify_the_memory()
    verify_the_user("images/show")
  end

  delete '/users/:user_id/memories/:memory_id/images/:image_id' do
    image = Photo.find(params[:image_id])
    memory = Memory.find(params[:memory_id])
    File.delete("./public/#{image.file_path}")
    image.delete
    flash[:alert] = "Photo deleted from Memory"
    redirect "/users/#{params[:user_id]}/lanes/#{memory.lane.id}"
  end

end
