class CreateMemories < ActiveRecord::Migration[5.2]
  def change
    create_table :memories do |t|
      t.string :title
      t.datetime :date
      t.string :location
      t.integer :lane_id
      t.integer :creator_user_id
    end
  end
end
