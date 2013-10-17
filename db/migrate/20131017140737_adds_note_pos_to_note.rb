class AddsNotePosToNote < ActiveRecord::Migration
  def change
    add_column :notes, :note_pos, :integer
    add_column :lists, :list_pos, :integer
  end
end
