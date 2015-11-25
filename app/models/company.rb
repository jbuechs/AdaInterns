class Company < ActiveRecord::Base
  has_many :interns, dependent: :destroy
  has_many :employees
  validates :name, presence: true

  def num_interns
    prev_interns = self.interns.count
    self.sponsor_four.nil? ? (prev_interns) : (prev_interns + self.sponsor_four)
  end

  def which_cohorts
    cohorts = []
    self.interns.each do |intern|
      cohorts.push(intern.cohort)
    end
    cohorts.push(4) if !self.sponsor_four.nil?
    return cohorts.uniq
  end
end
