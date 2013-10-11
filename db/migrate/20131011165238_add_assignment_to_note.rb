class AddAssignmentToNote < ActiveRecord::Migration
  def change
    add_column :notes, :assigned_user, :integer
  end
end
