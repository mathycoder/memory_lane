class User < ActiveRecord::Base
  has_many :user_lanes
  has_many :lanes, through: :user_lanes
  has_many :memories, through: :lanes
  #has_many :recollections, through: :memories
  has_many :recollections
  #has_many :images, through: :memories
  has_many :images

  has_secure_password

  def list(users)
    users_array = users.map {|user| user.name}
    users_array.delete(self.name)
    users_array[-1].prepend("and  ") if users_array.length > 1
    if users_array.length > 2
      users_array.join(", ")
    else
      users_array.join(" ")
    end
  end

  def self.alphabetize
    self.all.sort_by{|user| user.name}
  end

  def unhidden_lanes
    lanes = []
    self.user_lanes.each do |user_lane|
      lanes << user_lane.lane if !user_lane.hidden
    end
    lanes
  end

  def unhidden_memories
    memories = []
    unhidden_lanes.each do |lane|
      lane.memories.each do |memory|
        memories << memory
      end
    end
    memories 
  end

  def sorted_unhidden_memories
    unhidden_memories.sort_by{|memory| memory.date}.reverse
  end

end
