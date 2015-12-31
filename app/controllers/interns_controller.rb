class InternsController < ApplicationController
  before_action :get_intern, only: [:show, :destroy, :edit, :update]
  before_action :authenticate_intern!, except: [:index, :show]

  def index
    @interns = Intern.all.sort_by{ |intern| intern.last_name }
  end

  def show
  end

  def edit
  end

  def new
    @intern = Intern.new
  end

  def create
    Intern.create(intern_params[:intern])
    redirect_to admin_path
  end

  def update
    @intern.update(intern_params[:intern])
    redirect_to admin_path
  end

  def destroy
    @intern.destroy
    redirect_to admin_path
  end

  private
    def get_intern
      @intern = Intern.find(params[:id])
    end

    def intern_params
      params.permit(intern:[:id, :first_name, :last_name, :cohort, :twitter, :linked_in, :image, :company_id, :bio])
    end
end
