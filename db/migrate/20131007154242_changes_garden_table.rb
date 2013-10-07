class ChangesGardenTable < ActiveRecord::Migration
  def change
    remove_column :gardens, :user_id
    add_column :gardens, :user_id, :integer
  end
end
