require_relative "./application_controller.rb"

class RecollectionsController < ApplicationController

  get '/users/:user_id/memories/:memory_id/recollections/new' do
    redirect '/noaccess' if !ids_exist?(params)
    create_instance_variables(params)
    redirect '/noaccess' if !part_of_memory?
    verify_the_user("recollections/new")
  end

  post '/users/:user_id/memories/:memory_id/recollections' do
    recollection = Recollection.create
    recollection.user = User.find(params[:user_id])

    memory = Memory.find(params[:memory_id])
    recollection.memory = memory
    recollection.anecdote = params[:recollection][:anecdote] if !params[:recollection][:anecdote].empty?
    recollection.joke = params[:recollection][:joke] if !params[:recollection][:joke].empty?
    recollection.quote = params[:recollection][:quote] if !params[:recollection][:quote].empty?
    recollection.save

    flash[:alert] = "Recollection successfully added to Memory"
    redirect "/users/#{params[:user_id]}/lanes/#{memory.lane.id}"
  end

  get '/users/:user_id/memories/:memory_id/recollections/:recollection_id/edit' do
    redirect '/noaccess' if !ids_exist?(params)
    create_instance_variables(params)
    redirect '/noaccess' if !my_recollection? || !part_of_memory?
    verify_the_user("recollections/edit")
  end

  patch '/users/:user_id/memories/:memory_id/recollections/:recollection_id' do
    recollection = Recollection.find(params[:recollection_id])
    recollection.anecdote = params[:recollection][:anecdote]
    recollection.anecdote = nil if recollection.anecdote.empty?
    recollection.joke = params[:recollection][:joke]
    recollection.joke = nil if recollection.joke.empty?
    recollection.quote = params[:recollection][:quote]
    recollection.quote = nil if recollection.quote.empty?
    recollection.save

    memory = Memory.find(params[:memory_id])
    flash[:alert] = "Recollection edited"
    redirect "/users/#{params[:user_id]}/lanes/#{memory.lane.id}"
  end

  delete '/users/:user_id/memories/:memory_id/recollections/:recollection_id' do
    recollection = Recollection.find(params[:recollection_id])
    memory = Memory.find(params[:memory_id])
    recollection.delete
    flash[:alert] = "Recollection successfully deleted"
    redirect "/users/#{params[:user_id]}/lanes/#{memory.lane.id}"
  end
end
