class CropsController < ApplicationController

  def new
    @crop = Crop.new
  end

  def create
    @crop = Crop.new(params[:crop])
    if @crop.save
      redirect_to garden_url(@crop.garden)
    else
      render json: @crop.errors.full_messages
    end
  end

  def edit
    # do me
  end

  def show
    @crop = Crop.find(params[:id])
  end

  def update
    @crop = Crop.find(params[:id])
    @crop.update_attributes(params[:crop])
    if @crop.save
      redirect_to garden_url(@crop.garden_id)
    else
    end
  end
end