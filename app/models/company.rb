require 'open-uri'

class Company < ActiveRecord::Base
  has_many :interns, dependent: :destroy
  has_many :employees
  validates :name, presence: true


  # define ActiveRecord scopes for
  # :sorted_by, :search_query, :with_cohort_id
  filterrific(
  default_filter_params: { sorted_by: 'name_asc' },
  available_filters: [
    :sorted_by,
    :search_query,
    :with_cohort_id
  ]
)

  # returns the number of interns, including those for cohort 4
  def num_interns
    prev_interns = self.interns.count
    self.sponsor_four.nil? ? (prev_interns) : (prev_interns + self.sponsor_four)
  end

  # returns an array of which cohorts the company has sponsored
  def which_cohorts
    cohorts = []
    self.interns.each do |intern|
      cohorts.push(intern.cohort)
    end
    cohorts.push(4) if !self.sponsor_four.nil?
    return cohorts.uniq
  end

  # returns a hash of results of a query of the company's Glassdoor info
  def getGlassdoor
    response = open("http://api.glassdoor.com/api/api.htm?t.p=49111&t.k=kHImtMBuowe&userip=0.0.0.0&useragent=&format=json&v=1&action=employers&q=#{self.name}&city=Seattle").read
    parsed_json = ActiveSupport::JSON.decode(response)
    results = parsed_json["response"]
    return results
  end
end
