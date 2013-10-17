class ListsController < ApplicationController
  before_filter :require_current_user!, only: [:create]

  def show
    @list = List.find(params[:id])
  end

  def new
    @list = List.new
  end

  def create
    @list = List.new(params[:list])
    if @list.save
      redirect_to garden_url(@list.garden_id)
    else
      redirect_to garden_url(1)
    end
  end

  def update
    @list = List.find(params[:id])
      flash[:errors] = params
    if @list.update_attributes(params[:list])
      render json: @note
    else
      flash[:errors] = @note.errors
    end
  end
end
