class AddBioToIntern < ActiveRecord::Migration
  def change
    add_column :interns, :bio, :string
  end
end
