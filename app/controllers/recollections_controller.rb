require_relative "./application_controller.rb"

class RecollectionsController < ApplicationController

  get '/users/:user_id/memories/:memory_id/recollections/new' do
    binding.pry
  end

end


#{}"users/<%=@user.id%>/<%=memory.id%>/recollections/new"
