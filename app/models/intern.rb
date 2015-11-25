class Intern < ActiveRecord::Base
  belongs_to :company
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :cohort, presence: true

  def full_name
    return first_name + " " + last_name
  end
end
