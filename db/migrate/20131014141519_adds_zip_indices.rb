class AddsZipIndices < ActiveRecord::Migration

  add_index :crops, :zip
  add_index :users, :zip
  add_index :gardens, :zip

end
