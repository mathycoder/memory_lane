require 'active_support/core_ext/integer/inflections'

class Memory < ActiveRecord::Base
  belongs_to :lane
  has_many :recollections
  #may or may not need this one...
  has_many :users, through: :recollections

  # has_many :user_lanes, through: :lanes
  # has_many :users, through: :user_lanes

  def creator
    User.find(self.creator_user_id)
  end

  def display_date
    #self.date.httpdate.split(" 00:00:00").first
    self.date.strftime("%A, %B #{self.date.day.ordinalize}, %Y")
    #
  end

end
