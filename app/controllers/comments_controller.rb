class CommentsController < ApplicationController

  def new
    @comment = Comment.new
  end

  def create
    @comment = Comment.new(params[:comment])
    if @comment.save
      redirect_to note_url(@comment.note_id)
    else
      flash[:errors] = "what the what?"
    end
  end

  def edit
    @comment = Comment.find(params[:id])

    render "comments/form"
  end

  def destroy
    @comment = Comment.find(params[:id])
    note_id = @comment.note_id
    @comment.destroy
    redirect_to note_url(note_id)
  end

end
