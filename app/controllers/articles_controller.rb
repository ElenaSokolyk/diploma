class ArticlesController < ApplicationController
  # before_filter :authenticate_user!

  def new 
    @article = Article.new
  end

  def create
    @article = current_user.articles.build(article_params)
    if @article.save
      redirect_to user_root_path
      flash[:success] = "Your article was successfully created"
    else
      render "new"
    end
  end

  def show
    @article = Article.find(params[:id])
  end

  private 

  def article_params
    params.require(:article).permit(:title, :text)
  end
end