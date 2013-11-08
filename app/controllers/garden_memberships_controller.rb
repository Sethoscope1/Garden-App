class GardenMembershipsController < ApplicationController

  def new
    @garden_membership = GardenMembership.new
  end

  def create
    @garden_membership = GardenMembership.new(params[:garden_membership])
    if @garden_membership.save
      render json: "wow"
    else
      flash[:errors] = "Couldn't become a member"
    end
  end

end
