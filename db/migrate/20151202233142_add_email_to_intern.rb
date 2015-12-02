class AddEmailToIntern < ActiveRecord::Migration
  def change
    add_column :interns, :email, :string
  end
end
