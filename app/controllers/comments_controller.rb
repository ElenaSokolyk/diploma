class CommentsController < ApplicationController

  def create
    @comment = Comment.create(comment_params)
  end
  
  def destroy
    comment = Comment.find(params[:id]).destroy
    render json: {siblings_count: comment.siblings_count}, status: 200  
  end

  private

  def comment_params
    params.require(:comment).permit(:text, :user_id, :commentable_type, :commentable_id)
  end
end
