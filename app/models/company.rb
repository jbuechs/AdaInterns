class Company < ActiveRecord::Base
  has_many :interns
  has_many :employees
  validates :name, presence: true
end
