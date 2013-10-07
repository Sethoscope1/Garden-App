class NotesController < ApplicationController

  def new
    @note = Note.new

  def create
    @note = Note.new(params[:note])

    if @note.save
      redirect_to garden_url(@garden)
    else
      render :json => @note.errors.full_messages
    end
  end
end
