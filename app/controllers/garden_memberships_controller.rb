class GardenMembershipsController < ApplicationController

  def new
    @garden_membership = GardenMembership.new
  end

  def create
    @garden_membership = GardenMembership.new(params[:garden_membership])
    if @garden_membership.save
      redirect_to garden_url(@garden_membership.garden_id)
    else
      redirect_to garden_url(@garden_membership.garden_id)
    end
  end

end
