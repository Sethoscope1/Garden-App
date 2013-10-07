class Garden < ActiveRecord::Base
  attr_accessible :name, :user_id, :location

  belongs_to :user
  has_many :crops
  has_many :notes, through: :crops, source: :note

end
