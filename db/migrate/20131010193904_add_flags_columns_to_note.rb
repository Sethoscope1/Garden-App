class AddFlagsColumnsToNote < ActiveRecord::Migration
  def change
    add_column :notes, :flag1, :boolean
    add_column :notes, :flag2, :boolean
    add_column :notes, :flag3, :boolean
    add_column :notes, :flag4, :boolean
    add_column :notes, :flag5, :boolean
  end
end
