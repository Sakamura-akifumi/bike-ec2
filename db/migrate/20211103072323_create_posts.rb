class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.integer :user_id
      t.string :title
      t.text :content
      t.string :image_id
      t.float :rate
      t.timestamp :created_at
      t.timestamp :updated_at
      t.integer :bike_id

      t.timestamps
    end
  end
end
