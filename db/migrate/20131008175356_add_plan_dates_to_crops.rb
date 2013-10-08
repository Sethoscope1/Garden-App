class AddPlanDatesToCrops < ActiveRecord::Migration
  def change
    add_column :crops, :to_plant_date, :date
    add_column :crops, :to_harvest_date, :date
  end
end
