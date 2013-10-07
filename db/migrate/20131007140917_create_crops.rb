class CreateCrops < ActiveRecord::Migration
  def change
    create_table :crops do |t|
      t.string :name
      t.string :variant
      t.date :plant_date
      t.date :harvest_date

      t.timestamps
    end

    add_index :crops, :name
  end
end
