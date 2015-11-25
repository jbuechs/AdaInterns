class StaticPagesController < ApplicationController
  def index
  end

  def admin
    @interns = Intern.all
    @employees = Employee.all
    @companies = Company.all.sort_by { |company| company.name }
  end
end
