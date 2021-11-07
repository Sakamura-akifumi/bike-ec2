class CreateCcs < ActiveRecord::Migration[5.2]
  def change
    create_table :ccs do |t|
      t.string :digit

      t.timestamps
    end
  end
end
