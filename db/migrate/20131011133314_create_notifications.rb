class CreateNotifications < ActiveRecord::Migration
  def change
    create_table :notifications do |t|
      t.integer :note_id
      t.integer :user_id
      t.date :due
      t.string :text

      t.timestamps
    end
    add_index :notifications, :user_id
    add_index :notifications, :note_id
  end
end
