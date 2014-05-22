class CommentsController < ApplicationController

  # def new
  #   @comment = Comment.new
  # end

  def create
    # @article = Article.find(params[:id])
    puts "=========="
    puts comment_params
    @comment = Comment.new(comment_params)
    @comment.user_id = current_user.id
    @comment.save
    redirect_to user_root_path
  end

  private

  def comment_params
    params.require(:comment).permit(:text, :user_id, :commentable_type, :commentable_id)
  end
end
