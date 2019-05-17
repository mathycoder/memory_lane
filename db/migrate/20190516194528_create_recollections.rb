class CreateRecollections < ActiveRecord::Migration[5.2]
  def change
    create_table :recollections do |t|
      t.string :anecdote
      t.string :quote
      t.string :joke
      t.integer :user_id
      t.integer :memory_id
    end 
  end
end
