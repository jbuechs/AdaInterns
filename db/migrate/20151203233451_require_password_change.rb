class RequirePasswordChange < ActiveRecord::Migration
  def change
    add_column :interns, :change, :boolean, :default => true
  end
end
