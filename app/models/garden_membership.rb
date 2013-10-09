class GardenMembership < ActiveRecord::Base
  attr_accessible :garden_id, :user_id

  validates :user_id, uniqueness: { scope: :garden_id }

  belongs_to :user
  belongs_to :garden
end
