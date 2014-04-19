class Article < ActiveRecord::Base
  belongs_to :user
  has_many :comments, as: :commentable
  has_many :documents

  validates :text, :title, presence: true
  
  accepts_nested_attributes_for :documents
end
