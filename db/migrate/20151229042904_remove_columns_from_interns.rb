class RemoveColumnsFromInterns < ActiveRecord::Migration
  def change
    remove_column :interns, :email, :string
    remove_column :interns, :password_digest, :string
    remove_column :interns, :remember_digest, :string
  end
end
