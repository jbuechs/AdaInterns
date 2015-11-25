class EmployeesController < ApplicationController
  before_action :get_employee, only: [:destroy]

  def destroy
    @employee.destroy
    redirect_to admin_path
  end


  private
    def get_employee
      @employee = Employee.find(params[:id])
    end
end
