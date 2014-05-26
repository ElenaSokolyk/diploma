class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :commentable, polymorphic: true

  has_many :subcomments, as: :commentable, class_name: 'Comment', dependent: :destroy

  validates :text, presence: true
  
  def subcomment?
    commentable_type == 'Comment'
  end
  
  def siblings_count
    subcomment? ? commentable.subcomments.count : 0
  end
end
