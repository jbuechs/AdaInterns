class Intern < ActiveRecord::Base
  belongs_to :company
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :cohort, presence: true
end
