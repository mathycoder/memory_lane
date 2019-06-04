require_relative "./application_controller.rb"

class UserLanesController < ApplicationController
  patch '/lanes/:lane_id' do
    binding.pry 
  end
end
