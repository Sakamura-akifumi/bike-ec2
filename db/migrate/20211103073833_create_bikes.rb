class CreateBikes < ActiveRecord::Migration[5.2]
  def change
    create_table :bikes do |t|
      t.string :name
      t.string :image_id
      t.integer :company_id
      t.integer :cc_id
      t.timestamp :created_at
      t.timestamp :updated_at

      t.timestamps
    end
  end
end
