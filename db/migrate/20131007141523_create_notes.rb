class CreateNotes < ActiveRecord::Migration
  def change
    create_table :notes do |t|
      t.integer :user_id
      t.integer :crop_id
      t.text :text

      t.timestamps
    end

    add_index :notes, :user_id
    add_index :notes, :crop_id
  end
end
