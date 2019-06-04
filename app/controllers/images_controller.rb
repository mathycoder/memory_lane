require_relative "./application_controller.rb"

class ImagesController < ApplicationController

  get '/images/:image_id' do
    redirect '/noaccess' if !ids_exist?(params)
    create_instance_variables(params)
    all_images_find_previous_and_next()
    verify_the_user("images/index_show")
  end

  get '/memories/:memory_id/images/new' do
    redirect '/noaccess' if !ids_exist?(params)
    create_instance_variables(params)
    redirect '/noaccess' if !part_of_memory?
    verify_the_user("images/new")
  end

  post '/memories/:memory_id/images' do
    create_instance_variables(params)
    users_memory?()
    image = current_user.images.build(params[:image])
    image.memory = @memory
    image.file_path = params[:file][:filename]
    image.timestamp = DateTime.now
    image.save
    file = params[:file][:tempfile]
    File.open("./public/#{image.file_path}", 'wb') do |f|
      f.write(file.read)
    end
    flash[:alert] = "Photo successfully added to Memory"
    redirect "/lanes/#{@memory.lane.id}"
  end

  get '/memories/:memory_id/images/:image_id' do
    redirect '/noaccess' if !ids_exist?(params)
    create_instance_variables(params)
    redirect '/noaccess' if !part_of_memory?
    find_previous_and_next()
    verify_the_user("images/show")
  end

  delete '/memories/:memory_id/images/:image_id' do
    create_instance_variables(params)
    users_image?()
    File.delete("./public/#{@image.file_path}")
    @image.delete
    flash[:alert] = "Photo deleted from Memory"
    redirect "/lanes/#{@memory.lane.id}"
  end

end
