class GardensController < ApplicationController

  def new
    @garden = Garden.new
  end

  def create
    @garden = Garden.new(params[:garden])
    @garden.user_id = current_user.id

    if @garden.save
      redirect_to user_url(current_user)
    else
      render json: @garden.errors.full_messages
    end
  end

  def show

  end


end
