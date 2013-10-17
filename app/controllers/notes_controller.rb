class NotesController < ApplicationController
  before_filter :require_current_user!, only: [:create]

  def new
    @note = Note.new
  end

  def create
    @note = Note.new(params[:note])
    @note.note_pos = @note.list.notes.length
    if params[:crop]
      @note.crops.new(params[:crop])
      @note.title = params[:crop][:name]
    end
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
    else
      render :index
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

  def toggle_flag
    @note = Note.find(params[:id])
    @note.toggle!(params[:flag])

    if request.xhr?
      render json: @note
    else
      redirect_to note_url(@note)
    end
  end
end


