class AddsNoteIdToCrops < ActiveRecord::Migration
  def change
    add_column :crops, :list_id, :integer
  end
end
