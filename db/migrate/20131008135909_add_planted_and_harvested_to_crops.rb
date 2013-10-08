class AddPlantedAndHarvestedToCrops < ActiveRecord::Migration
  def change
    add_column :crops, :harvested, :boolean
    add_column :crops, :planted, :boolean
  end
end
