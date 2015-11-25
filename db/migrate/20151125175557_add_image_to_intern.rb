class AddImageToIntern < ActiveRecord::Migration
  def change
    add_column :interns, :image, :string
  end
end
