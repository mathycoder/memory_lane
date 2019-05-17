class Lane < ActiveRecord::Base
  has_many :user_lanes
  has_many :users, through: :user_lanes
  has_many :memories
  has_many :recollections, through: :memories 
end
