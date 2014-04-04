class University < ActiveRecord::Base
  has_many :faculties
  # has_many :departments

  validates :name, presence: true, :length => { :maximum => 100 }
  
  has_many :users
end
