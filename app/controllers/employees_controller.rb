class EmployeesController < ApplicationController
  before_action :get_employee, only: [:destroy, :edit]

  def destroy
    @employee.destroy
    redirect_to admin_path
  end

  def new
    @employee = Employee.new
  end

  def edit
  end

  def update
  end


  private
    def get_employee
      @employee = Employee.find(params[:id])
    end
end
