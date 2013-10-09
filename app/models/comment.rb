class Comment < ActiveRecord::Base
  attr_accessible :note_id, :text, :user_id

  validates :note_id, :text, :user_id, presence: true

  belongs_to :user
  belongs_to :note

end
