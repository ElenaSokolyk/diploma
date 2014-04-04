class Role < ActiveRecord::Base
  has_and_belongs_to_many :users, join_table: :users_roles
  belongs_to :resource, polymorphic: true
  
  scopify
  
  validate :available_roles
  private
  def available_roles
    if name.nil? || !%(student professor head).include?(name)
      errors.add(:name, "Only student, professor or head is available")
    end
  end
end
