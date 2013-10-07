class NotesController < ApplicationController

  def new
    @note = Note.new
  end

  def create
    @note = Note.new(params[:note])

    if @note.save
      redirect_to note_url(@note)
    else
      render :json => @note.errors.full_messages
    end
  end

  def show
    @note = Note.find(params[:id])
    render :show
  end

  def edit
    @note = Note.find(params[:id])
    render :new
  end

end
