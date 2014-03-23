class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :article
  belongs_to :commentable, polymorphic: true
  has_many :subcomments, as: :commentable, class_name: 'Comment', dependent: :destroy

  validates :text, presence: true
end
