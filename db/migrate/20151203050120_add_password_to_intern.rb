class AddPasswordToIntern < ActiveRecord::Migration
  def change
    add_index :interns, :email, unique: true
    add_column :interns, :password_digest, :string
  end
end
