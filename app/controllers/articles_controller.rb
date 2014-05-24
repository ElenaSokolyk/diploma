class ArticlesController < ApplicationController
  def index
    @articles = current_user.articles.includes(:documents)
  end

  def new 
    @article = Article.new
    @article.documents.build
  end

  def edit
    @article = Article.find(params[:id])
    @article.documents.build
  end

  def update
    @article = Article.find(params[:id]) 
    @article.update_attributes(article_params)
    redirect_to @article
  end

  def destroy
    article = Article.find(params[:id])
    if article.destroy
      redirect_to user_root_path
      flash[:success] = "Your article was successfully deleted"
    else
      render 'nothing'
    end
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
    @comment = current_user.comments.build(commentable: @article)
  end

  private 

  def article_params
    params.require(:article).permit(:title, :text, 
      documents_attributes: [:id, :title, :file, :_destroy])
  end
end