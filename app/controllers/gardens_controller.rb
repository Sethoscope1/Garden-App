class GardensController < ApplicationController
    before_filter :require_current_user!, only: [:create, :new]

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
    @garden = Garden.find(params[:id])
  end


end
