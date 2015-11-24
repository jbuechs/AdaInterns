class CreateInterns < ActiveRecord::Migration
  def change
    create_table :interns do |t|
      t.string :first_name
      t.string :last_name
      t.integer :cohort
      t.string :twitter
      t.string :linked_in
      t.integer :company_id

      t.timestamps null: false
    end
    add_index :interns, :company_id
  end
end
