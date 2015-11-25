class InternsController < ApplicationController
  before_action :get_intern, only: [:show]

  def index
    @interns = Intern.all.sort_by{ |intern| intern.last_name }
  end

  def show
  end

  private
    def get_intern
      @intern = Intern.find(params[:id])
    end
end
