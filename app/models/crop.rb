class Crop < ActiveRecord::Base
  attr_accessible :name, :variant, :list_id, :garden_id, :plant_date, :harvest_date, :to_plant_date, :to_harvest_date, :user_id

  validates :garden_id, presence: true

  belongs_to :garden
  belongs_to :user
  belongs_to :list

  # moving notes to list - be sure to update
  has_many :notes, dependent: :destroy

end
