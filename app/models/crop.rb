class Crop < ActiveRecord::Base
  attr_accessible :name, :variant, :garden_id, :plant_date, :harvest_date
  belongs_to :garden
  belongs_to :user

end
