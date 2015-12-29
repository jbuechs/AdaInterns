class AddRememberTokenToInterns < ActiveRecord::Migration
  def change
    add_column :interns, :remember_token, :string
  add_index  :interns, :remember_token
  end
end
