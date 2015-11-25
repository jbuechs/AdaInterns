class InternsController < ApplicationController

  def index
    @interns = Intern.all
  end
end
