class Company < ActiveRecord::Base
  has_many :interns, dependent: :destroy
  has_many :employees
  validates :name, presence: true
end
