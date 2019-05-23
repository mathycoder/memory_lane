class Lane < ActiveRecord::Base
  has_many :user_lanes
  has_many :users, through: :user_lanes
  has_many :memories
  has_many :recollections, through: :memories

  def alphabetized_firstnames(current_user)
    list = self.users.sort_by{|user| user.name}.map{|user| user.name.split(" ").first}
    list.delete(current_user.name.split(" ").first)
    list.join("-")
  end

end
