class Crop < ActiveRecord::Base
  attr_accessible :name, :variant, :list_id, :garden_id, :zip, :plant_date, :harvest_date, :to_plant_date, :to_harvest_date, :user_id, :note_id

  # remove garden_id validation, move to note_id
  validates :name, :garden_id, presence: true
  has_many :notes
  belongs_to :note
  #remove garden_association, move to note
  belongs_to :garden
  belongs_to :user
  belongs_to :list
  # moving notes to list - be sure to update


  #careful with crops in radius - could too big
  def get_crops_in_radius(zip, distance)
    local_zips = get_zips_in_radius(zip, distance)
    Crop.where("zip = ?", 11215).to_a
  end

end
