class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_filter :remove_unrelated_documents
  
  layout :choose_layout
  
  protected
  
  def choose_layout
    user_signed_in? && !admin_url? ? 'application' : 'unauthorized'
  end

  private

  def admin_url?
    request.url.match /admin/ 
  end
  
  def remove_unrelated_documents
    Document.where('article_id IS NULL OR file IS NULL').destroy_all
  end
end
