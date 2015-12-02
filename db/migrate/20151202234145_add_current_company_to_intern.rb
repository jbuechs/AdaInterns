class AddCurrentCompanyToIntern < ActiveRecord::Migration
  def change
    add_column :interns, :current_company, :string
  end
end
