class User < ActiveRecord::Base
  # has_many :recollections
  #
  # #this next one is the only one I'm worried about.  Should it
  # #go through recollections or lanes?
  # has_many :memories, through: :recollections
  # has_many :user_lanes
  # has_many :lanes, through: :user_lanes

  has_many :user_lanes
  has_many :lanes, through: :user_lanes
  has_many :memories, through: :lanes
  has_many :recollections, through: :memories 


end


# I want to be able to do adam.memories and see all his memories.
