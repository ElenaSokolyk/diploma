class Group < ActiveRecord::Base
  belongs_to :department

  validates :name, presence: true, :length => { :maximum => 100 }
  validates :department_id, presence: true,
                         	:numericality => { only_integer: true, greater_than: 0 }
end
