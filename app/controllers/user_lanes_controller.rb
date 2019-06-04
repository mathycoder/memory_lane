require_relative "./application_controller.rb"

class UserLanesController < ApplicationController
  patch '/lanes/:lane_id' do
    create_instance_variables(params)
    current_user.user_lanes.each {|user_lane| user_lane.update(hidden: true) if user_lane.lane == @lane}
    redirect "/lanes"
  end

  patch '/lanes' do
    current_user.user_lanes.each {|user_lane| user_lane.update(hidden: false)}
    redirect "/lanes"
  end
end
