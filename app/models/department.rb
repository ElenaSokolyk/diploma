class Department < ActiveRecord::Base
  belongs_to :faculty
  has_many :groups

  validates :name, presence: true, :length => { :maximum => 100 }
  validates :faculty_id, presence: true,
                         :numericality => { only_integer: true, greater_than: 0 }
end
