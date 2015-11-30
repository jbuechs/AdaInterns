class CompaniesController < ApplicationController
  before_action :get_company, only: [:show, :destroy, :edit, :update]

  def index
    @filterrific = initialize_filterrific(
    Company,
    params[:filterrific],
      :select_options => {
        sorted_by: Company.options_for_sorted_by,
      }
    ) or return
    @companies = Company.all
    respond_to do |format|
      format.html
      format.js
    end
  end

  def show
    results = @company.getGlassdoor
    @ratings = results["employers"].first
    @url = results["attributionURL"]
  end

  def new
    @company = Company.new
  end

  def edit
  end

  def update
    @company.update(company_params[:company])
    redirect_to admin_path
  end

  def create
    Company.create(company_params[:company])
    redirect_to admin_path
  end

  def destroy
    @company.destroy
    redirect_to admin_path
  end

  def company_map
    @companies = Company.all
    @hash = Gmaps4rails.build_markers(@companies) do |company, marker|
      marker.lat company.latitude
      marker.lng company.longitude
      # marker.name company.name
      # marker.infowindow "I'm a company"
    end
  end

  private
    def get_company
      @company = Company.find(params[:id])
    end

    def company_params
      params.permit(company:[:id, :name, :street, :city, :state, :zip, :website, :logo])
    end

end
