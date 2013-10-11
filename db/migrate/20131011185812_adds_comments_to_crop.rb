class AddsCommentsToCrop < ActiveRecord::Migration
  def change
    add_column :crops, :comments, :string
  end
end
