class List < ActiveRecord::Base
  attr_accessible :user_id, :garden_id, :name, :list_pos

  validates :user_id, :garden_id, presence: true

  belongs_to :garden
  belongs_to :user

  has_many :crops, dependent: :destroy
  has_many :notes, dependent: :destroy

end
