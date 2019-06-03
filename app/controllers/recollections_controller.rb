require_relative "./application_controller.rb"

class RecollectionsController < ApplicationController

  get '/memories/:memory_id/recollections/new' do
    redirect '/noaccess' if !ids_exist?(params)
    create_instance_variables(params)
    redirect '/noaccess' if !part_of_memory?
    verify_the_user("recollections/new")
  end

  post '/memories/:memory_id/recollections' do
    if params[:recollection][:anecdote].empty? && params[:recollection][:joke].empty? && params[:recollection][:quote].empty?
      flash[:alert] = "This recollection is blank.  Try entering some information before submitting."
      redirect "/memories/#{params[:memory_id]}/recollections/new"
    end

    create_instance_variables(params)
    #jennifer's addition... wouldn't work because it goes through more than one association
    #recollection = current_user.recollections.build(params[:recollection])

    recollection = Recollection.create(params[:recollection])
    recollection.user = User.find(current_user.id)
    recollection.memory = @memory
    recollection.timestamp = DateTime.now
    recollection.save
    flash[:alert] = "Recollection successfully added to Memory"
    redirect "/lanes/#{@memory.lane.id}"
  end

  get '/memories/:memory_id/recollections/:recollection_id/edit' do
    redirect '/noaccess' if !ids_exist?(params)
    create_instance_variables(params)
    redirect '/noaccess' if !my_recollection? || !part_of_memory?
    verify_the_user("recollections/edit")
  end

  patch '/memories/:memory_id/recollections/:recollection_id' do
    create_instance_variables(params)
    users_recollection?()

    if params[:recollection][:anecdote].empty? && params[:recollection][:joke].empty? && params[:recollection][:quote].empty?
      @recollection.delete
    else
      @recollection.anecdote = params[:recollection][:anecdote]
      @recollection.anecdote = nil if @recollection.anecdote.empty?
      @recollection.joke = params[:recollection][:joke]
      @recollection.joke = nil if @recollection.joke.empty?
      @recollection.quote = params[:recollection][:quote]
      @recollection.quote = nil if @recollection.quote.empty?
      @recollection.timestamp = DateTime.now
      @recollection.save
    end

    memory = Memory.find(params[:memory_id])
    flash[:alert] = "Recollection edited"
    redirect "/lanes/#{memory.lane.id}"
  end

  delete '/memories/:memory_id/recollections/:recollection_id' do
    create_instance_variables(params)
    users_recollection?()

    @recollection.delete
    flash[:alert] = "Recollection successfully deleted"
    redirect "/lanes/#{@memory.lane.id}"
  end
end
