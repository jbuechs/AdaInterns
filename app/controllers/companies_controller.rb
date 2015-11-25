class CompaniesController < ApplicationController
  before_action :get_company, only: [:show]

  def index
    @companies = Company.all.sort_by { |company| company.name }
  end

  def show
    results = @company.getGlassdoor
    @ratings = results["employers"].first
    @url = results["attributionURL"]
  end

  private
    def get_company
      @company = Company.find(params[:id])
    end

end
