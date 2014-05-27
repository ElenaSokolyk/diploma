class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  layout :choose_layout
  
  protected
  
  def choose_layout
    user_signed_in? && !admin_url? ? 'application' : 'unauthorized'
  end

  private

  def admin_url?
    request.url.match /admin/ 
  end
end
