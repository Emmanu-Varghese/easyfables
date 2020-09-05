class CommentsController < ApplicationController

  def create
    @comment = @commentable.comments.new(comment_params)
    @comment.user = current_user
    @comment.save
    respond_to do |format|
      format.html { redirect_to @commentable }
      format.js
    end
  end

  def destroy
    @comment = @commentable.comments.find(params[:id])
    @comment_id = @comment.id
    if @comment.destroy
      render layout: false
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:body, :parent_id)
  end
end
