require_relative "./application_controller.rb"

class ImagesController < ApplicationController

  get '/users/:user_id/memories/:memory_id/images/new' do
    redirect '/noaccess' if !ids_exist?(params)
    create_instance_variables(params)
    redirect '/noaccess' if !part_of_memory?
    verify_the_user("images/new")
  end

  post '/users/:user_id/memories/:memory_id/images' do
    image = Image.create()
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
    redirect '/noaccess' if !id_exists?(params[:user_id], User) || !id_exists?(params[:memory_id], Memory) || !id_exists?(params[:image_id], Image)
    @user = User.find(params[:user_id])
    @memory = Memory.find(params[:memory_id])
    @image = Image.find(params[:image_id])

    redirect '/noaccess' if !part_of_memory?
    verify_the_user("images/show")
  end

  delete '/users/:user_id/memories/:memory_id/images/:image_id' do
    image = Image.find(params[:image_id])
    memory = Memory.find(params[:memory_id])
    File.delete("./public/#{image.file_path}")
    image.delete
    flash[:alert] = "Photo deleted from Memory"
    redirect "/users/#{params[:user_id]}/lanes/#{memory.lane.id}"
  end

end
