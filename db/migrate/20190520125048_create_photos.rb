class CreatePhotos < ActiveRecord::Migration[5.2]
  def change
    create_table :photos do |t|
      t.string :file_path
      t.string :caption
      t.integer :user_id
      t.integer :memory_id
    end
  end
end
