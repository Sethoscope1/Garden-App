class Crop < ActiveRecord::Base
  attr_accessible :name, :variant, :garden_id, :plant_date, :harvest_date, :to_plant_date, :to_harvest_date

  validates :garden_id, presence: true

  belongs_to :garden
  belongs_to :user
  has_many :notes

end
