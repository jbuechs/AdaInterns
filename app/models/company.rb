require 'open-uri'

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

  def getGlassdoor
    response = open("http://api.glassdoor.com/api/api.htm?t.p=49111&t.k=kHImtMBuowe&userip=0.0.0.0&useragent=&format=json&v=1&action=employers&q=#{self.name}&city=Seattle").read
    parsed_json = ActiveSupport::JSON.decode(response)
    results = parsed_json["response"]
    return results
  end
end
