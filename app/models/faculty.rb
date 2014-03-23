class Faculty < ActiveRecord::Base
  belongs_to :university
  has_many :departments

  validates :name, presence: true, :length => { :maximum => 100 }
  validates :university_id, presence: true,
                            :numericality => { only_integer: true, greater_than: 0 }
end
