class ChangeList < ActiveRecord::Migration
  def change
    rename_column :lists, :creator_id, :user_id
  end
end
