class ArticlesController < ApplicationController
  def index
    @articles = current_user.articles.includes(:documents)
  end

  def new 
    @article = Article.new
    @article.documents.build
  end

  def create
    puts article_params
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
    params.require(:article).permit(:title, :text, 
      documents_attributes: [:id, :title, :file, :_destroy])
  end
end