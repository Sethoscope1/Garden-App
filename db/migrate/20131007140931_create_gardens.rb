class CreateGardens < ActiveRecord::Migration
  def change
    create_table :gardens do |t|
      t.string :name
      t.string :user_id
      t.string :location

      t.timestamps
    end

    add_index :gardens, :user_id
  end
end
