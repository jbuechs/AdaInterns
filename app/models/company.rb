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
    ]
  )

  scope :search_query, lambda { |query|
    return nil  if query.blank?
    # condition query, parse into individual keywords
    terms = query.downcase.split(/\s+/)
    # replace "*" with "%" for wildcard searches,
    # append '%', remove duplicate '%'s
    terms = terms.map { |e|
      (e.gsub('*', '%') + '%').gsub(/%+/, '%')
    }
    # configure number of OR conditions for provision
    # of interpolation arguments. Adjust this if you
    # change the number of OR conditions.
    num_or_conditions = 2
    where(
      terms.map {
        or_clauses = [
          "LOWER(companies.name) LIKE ?",
          "LOWER(companies.website) LIKE ?"
        ].join(' OR ')
        "(#{ or_clauses })"
      }.join(' AND '),
      *terms.map { |e| [e] * num_or_conditions }.flatten
    )
  }

  scope :sorted_by, lambda { |sort_option|
    # extract the sort direction from the param value.
    direction = (sort_option =~ /desc$/) ? 'desc' : 'asc'
    case sort_option.to_s
    when /^name_/
      order("LOWER(companies.name) #{ direction }")
    when /^num_interns_/
    else
      raise(ArgumentError, "Invalid sort option: #{ sort_option.inspect }")
    end
  }

  delegate :name, :to => :company, :prefix => true

  def self.options_for_sorted_by
      [
        ['Name (a-z)', 'name_asc'],
        ['Name (z-a)', 'name_desc'],
        ['# of Interns (descending)', 'num_interns_desc'],
      ]
  end



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
