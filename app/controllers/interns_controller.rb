class InternsController < ApplicationController

  def index
    @interns = Intern.all.sort_by{ |intern| intern.last_name }
  end
end
