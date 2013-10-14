class AddsLocationToUsers < ActiveRecord::Migration
  def change
    add_column :crops, :zip, :integer
    add_column :users, :zip, :integer
    add_column :gardens, :zip, :integer
  end
end
