class AddNameToInterns < ActiveRecord::Migration
  def change
    add_column :interns, :name, :string
    remove_column :interns, :first_name, :string
    remove_column :interns, :last_name, :string
  end
end
