class AddNewFieldsToUser < ActiveRecord::Migration
  def change
    add_column :users, :position, :string
    add_column :users, :name, :string
    add_column :users, :surname, :string
    add_column :users, :patronymic, :string
  end
end
