class Note < ActiveRecord::Base
  attr_accessible :user_id, :crop_id, :list_id, :title, :text, :note_photo, :due_date, :flag1, :flag2, :flag3, :flag4, :flag5

  belongs_to :user
  belongs_to :crop
  belongs_to :list

  has_many :notifications
  has_many :comments

  # moving from list to crop - update!

  has_attached_file :note_photo, styles: {
    big: "512x384>",
    small: "150x150#"
  }

end