class Garden < ActiveRecord::Base
  attr_accessible :name, :user_id, :location

  validates :name, :user_id, presence: true

  belongs_to :user
  has_many :lists, dependent: :destroy
  has_many :crops, dependent: :destroy
  has_many :notes, through: :crops, source: :note
  has_many :garden_memberships, dependent: :destroy
  has_many :gardeners, through: :garden_memberships, source: :user

end
