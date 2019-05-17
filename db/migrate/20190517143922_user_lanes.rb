class UserLanes < ActiveRecord::Migration[5.2]
  def change
    create_table :user_lanes do |t|
      t.integer :user_id
      t.integer :lane_id
    end 
  end
end
