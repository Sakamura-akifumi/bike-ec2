class CreateRankings < ActiveRecord::Migration[5.2]
  def change
    create_table :rankings do |t|
      t.integer :post_id
      t.integer :bike_id
      t.timestamp :created_at
      t.timestamp :updated_at

      t.timestamps
    end
  end
end
