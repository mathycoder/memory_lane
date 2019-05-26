require 'active_support/core_ext/integer/inflections'

class Memory < ActiveRecord::Base
  belongs_to :lane
  has_many :recollections
  has_many :images
  #may or may not need this one...
  has_many :users, through: :recollections

  # has_many :user_lanes, through: :lanes
  # has_many :users, through: :user_lanes

  def creator
    User.find(self.creator_user_id)
  end

  def display_date
    self.date.strftime("%A, %B #{self.date.day.ordinalize}, %Y")
  end

  def date_for_input_field
    array = self.date.to_formatted_s.split(" ").first.split("-")
    "#{array[1]}-#{array[2]}-#{array[0]}"
  end

  def self.sorted_by_newest
    Memory.all.sort_by{|memory| memory.date}.reverse
  end

  def self.all_images_chronologically
    images = []
    self.sorted_by_newest.each do |memory|
      memory.images.each do |image|
        images << image
      end
    end
    images
  end

  def self.most_recent_images
    self.all_images_chronologically[0..5]
  end

end
