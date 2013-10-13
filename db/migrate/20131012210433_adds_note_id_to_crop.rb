class AddsNoteIdToCrop < ActiveRecord::Migration
  def change
    add_column :crops, :note_id, :integer
  end
end
