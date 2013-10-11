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

  def update
    @note = Note.find(params[:id])
    if @note.update_attributes(params[:note])
      redirect_to note_url(@note)
      flash[:errors] = "Huhwut"
    else
      flash[:errors] = "is this thing on?"
    end
  end



  def destroy
    @note = Note.find(params[:id])
    garden = @note.list.garden

    @note.destroy
    redirect_to garden_url(garden)
  end

  def show
    @note = Note.find(params[:id])
  end

  def edit
    @note = Note.find(params[:id]) || Note.new
    render :new
  end

end
