class CropsController < ApplicationController

  def new
    @crop = Crop.new
    # @garden = Garden.find(params[:id])
  end

  def create
    @crop = Crop.new(params[:crop])

    if @crop.save
      redirect_to user_url(current_user)
    else
      render json: @crop.errors.full_messages
    end
  end

  def destroy

  end
end