class Employee < ActiveRecord::Base
  belongs_to :company
  validates :first_name, presence: true
  validates :company_id, presence: true
end
