class CreateEmployees < ActiveRecord::Migration
  def change
    create_table :employees do |t|
      t.string :first_name
      t.string :last_name
      t.string :position
      t.string :email
      t.string :twitter
      t.string :linkedin
      t.string :image
      t.integer :company_id

      t.timestamps null: false
    end
    add_index :employees, :company_id
  end
end
