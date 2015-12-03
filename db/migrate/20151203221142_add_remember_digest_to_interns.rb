class AddRememberDigestToInterns < ActiveRecord::Migration
  def change
    add_column :interns, :remember_digest, :string
  end
end
