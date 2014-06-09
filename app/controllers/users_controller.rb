class UsersController < ApplicationController
  def show
    @user = User.includes(:articles).find(params[:id])
  end

  def follow
    if current_user.subscriptions.create(user_id: params[:id]).persisted?
      flash[:notice] = "Your subscription was successfuly created"
    else
      flash[:error] = "Your subscription can't be created"
    end
    redirect_to :back
  end

  def unfollow
    current_user.subscriptions.find_by(user_id: params[:id]).destroy
    flash[:notice] = "Your subscription was successfuly removed"
    redirect_to :back
  end

  private
end
