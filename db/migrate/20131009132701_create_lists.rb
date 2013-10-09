class CreateLists < ActiveRecord::Migration
  def change
    create_table :lists do |t|
      t.integer :creator_id
      t.integer :garden_id

      t.timestamps
    end

    add_index :lists, :garden_id
    add_index :lists, :creator_id
  end
end
