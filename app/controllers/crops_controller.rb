class CropsController < ApplicationController

  def new
    @crop = Crop.new
  end

  def create
    @crop = Crop.new(params[:crop])
    if @crop.save
      @note = Note.new(params[:note])
      @note.user_id = current_user.id
      @note.crop_id = @crop.id
      @note.save
      redirect_to garden_url(@crop.garden)
    else
      render json: @crop.errors.full_messages
    end
  end

  def edit
    # do me
  end

  def update
    @crop = Crop.find(params[:id])
    @crop.update_attributes(params[:crop])
    if @crop.save
      flash[:errors] = "updated?"
      redirect_to garden_url(@crop.garden_id)
    else
      flash[:errors] = "couldn't edit crop"
    end
  end
end