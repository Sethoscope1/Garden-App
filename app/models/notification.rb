class Notification < ActiveRecord::Base
  attr_accessible :note_id, :text, :user_id, :due

  validates :note_id, :user_id, presence: true

  belongs_to :note
  belongs_to :user
end
