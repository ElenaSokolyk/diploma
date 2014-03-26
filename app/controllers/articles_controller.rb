class ArticlesController < ApplicationController

  def new 
    @article = Article.new
  end

  def create
    @article = current_user.articles.create(article_params)
    if @article.save
      redirect_to root_path
      flash[:success] = "Your article was successfully created"
    else
      render "new"
    end
  end

  private 

  def article_params
    params.require(:article).permit(:title, :text)
  end
end