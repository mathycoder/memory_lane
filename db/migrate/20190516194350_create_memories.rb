class CreateMemories < ActiveRecord::Migration[5.2]
  def change
    create_table :memories do |t|
      t.string :title
      t.date :date
      t.string :location
      t.integer :lane_id
    end
  end
end
