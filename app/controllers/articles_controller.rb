class ArticlesController < ApplicationController
  skip_before_filter :remove_unrelated_documents, only: [:create, :update]

  def index
    @articles = current_user.articles.includes(:documents)
  end

  def new 
    @article = Article.new
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id]) 
    @article.update_attributes(article_params)
    attach_documents
    redirect_to @article
  end

  def destroy
    article = Article.find(params[:id])
    if article.destroy
      flash[:success] = "Your article was successfully deleted"
      redirect_to user_root_path
    else
      render 'nothing'
    end
  end

  def create
    @article = current_user.articles.build(article_params)
    if @article.save
      attach_documents
      flash[:success] = "Your article was successfully created"
      redirect_to user_root_path
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
    params.require(:article).permit(:title, :text)
  end
  
  def attach_documents
    Document.where(id: document_ids).update_all(article_id: @article.id)
  end
  
  def document_ids
    params[:article][:documents_attributes].map {|document| document[:id]} if params[:article][:documents_attributes]
  end
end