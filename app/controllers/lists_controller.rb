class ListsController < ApplicationController

  def index

  end


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

end
