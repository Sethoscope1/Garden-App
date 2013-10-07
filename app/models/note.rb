class Note < ActiveRecord::Base
  attr_accessible :user_id, :crop_id, :title, :text
  belongs_to :user
  belongs_to :crop
end
