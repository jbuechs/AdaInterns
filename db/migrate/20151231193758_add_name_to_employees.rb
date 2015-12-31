class AddNameToEmployees < ActiveRecord::Migration
  def change
    add_column :employees, :name, :string
    remove_column :employees, :first_name, :string
    remove_column :employees, :last_name, :string

  end
end
