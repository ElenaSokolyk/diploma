class Article < ActiveRecord::Base
  belongs_to :user
  has_many :comments, as: :commentable

  validates :text, :title, presence: true
end
