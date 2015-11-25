class InternsController < ApplicationController
  before_action :get_intern, only: [:show, :destroy]

  def index
    @interns = Intern.all.sort_by{ |intern| intern.last_name }
  end

  def show
  end

  def destroy
    @intern.destroy
    redirect_to admin_path
  end

  private
    def get_intern
      @intern = Intern.find(params[:id])
    end
end
