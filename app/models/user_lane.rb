class UserLane < ActiveRecord::Base
  belongs_to :user
  belongs_to :lane 
end
