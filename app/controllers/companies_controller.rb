class CompaniesController < ApplicationController
  before_action :get_company, only: [:show, :destroy]

  def index
    @companies = Company.all.sort_by { |company| company.name }
  end

  def show
    results = @company.getGlassdoor
    @ratings = results["employers"].first
    @url = results["attributionURL"]
  end

  def destroy
    @company.destroy
    redirect_to admin_path
  end

  private
    def get_company
      @company = Company.find(params[:id])
    end

end
