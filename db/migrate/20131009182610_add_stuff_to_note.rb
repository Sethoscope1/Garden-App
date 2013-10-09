class AddStuffToNote < ActiveRecord::Migration
  def change
    add_column :notes, :due_date, :date
    add_column :notes, :completion, :boolean
  end
end
