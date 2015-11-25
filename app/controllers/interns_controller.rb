class InternsController < ApplicationController

  def index
    @interns = Intern.all.sort_by{ |intern| intern.last_name }
  end

  def show
    id = params[:id]
    @intern = Intern.find(id)
  end
end
