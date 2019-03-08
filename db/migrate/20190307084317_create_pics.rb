class CreatePics < ActiveRecord::Migration[5.2]
  def change
    create_table :pics do |t|
      t.string :file
      t.integer :item_id
      t.string :item_type
      t.timestamps
    end
  end
end
