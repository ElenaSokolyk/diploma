class UserDecorator < Draper::Decorator
  delegate_all

  def initials
    patronymic_short = patronymic ? "#{patronymic.first}." : nil
    "#{surname} #{name.first}.#{patronymic_short}"
  end

  def subscription_link_for(user)
    unless id == user.id
      if subscriptions.where(user_id: user.id).first
        h.link_to'Unfollow', h.unfollow_user_path(user), method: :delete, class: 'btn btn-danger'
      else
        h.link_to 'Follow', h.follow_user_path(user), method: :post, class: 'btn btn-success'
      end
    end
  end
end
