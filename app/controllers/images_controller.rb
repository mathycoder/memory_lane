require_relative "./application_controller.rb"

class ImagesController < ApplicationController

  get '/images/new' do
    erb :'images/new'
  end

  post '/images' do
    @filename = params[:file][:filename]
    file = params[:file][:tempfile]

    File.open("./public/#{@filename}", 'wb') do |f|
      f.write(file.read)
    end

    erb :'images/show_image'
  end

end
