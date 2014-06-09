class Subscription < ActiveRecord::Base
  belongs_to :owner, class_name: 'User', foreign_key: 'owner_id'
  belongs_to :user, class_name: 'User'

  validates :owner_id, :user_id, presence: true
end
