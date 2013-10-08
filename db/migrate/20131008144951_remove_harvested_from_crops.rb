class RemoveHarvestedFromCrops < ActiveRecord::Migration
  def change
    remove_column :crops, :harvested
    remove_column :crops, :planted
  end
end
