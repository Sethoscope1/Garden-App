class CommentsController < ApplicationController
  before_filter :require_current_user!, only: [:create]

  def new
    @comment = Comment.new
  end

  def create
    @comment = Comment.new(params[:comment])
    if @comment.save
      render json: @comment
    else
      render json: @comment
    end
  end

  def edit
    @comment = Comment.find(params[:id])

    render :new
  end

  def destroy
    @comment = Comment.find(params[:id])
    note_id = @comment.note_id
    @comment.destroy
    redirect_to note_url(note_id)
  end

end
