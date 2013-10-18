class Garden < ActiveRecord::Base
  include ApplicationHelper
  attr_accessible :name, :user_id, :location, :zip

  validates_numericality_of :zip, allow_nil: true

  validates :name, :user_id, presence: true

  belongs_to :user
  has_many :lists, dependent: :destroy
  has_many :crops, dependent: :destroy
  has_many :notes, through: :crops, source: :note
  has_many :garden_memberships, dependent: :destroy
  has_many :gardeners, through: :garden_memberships, source: :user

  def get_gardens_in_radius(zip, distance)
    local_zips = get_zips_in_radius(zip, distance)
    Garden.where("zip = ?", 11215).to_a
  end
end
