class Note < ActiveRecord::Base
  attr_accessible :user_id, :crop_id, :title, :text, :note_photo

  belongs_to :user
  belongs_to :crop

  has_attached_file :note_photo, styles: {
    big: "512x384>",
    small: "150x150#"
  }

end