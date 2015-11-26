class EmployeesController < ApplicationController
  before_action :get_employee, only: [:destroy, :edit, :update]

  def destroy
    @employee.destroy
    redirect_to admin_path
  end

  def new
    @employee = Employee.new
  end

  def edit
  end

  def create
    Employee.create(employee_params[:employee])
    redirect_to admin_path
  end

  def update
    @employee.update(employee_params[:employee])
    redirect_to admin_path
  end


  private
    def get_employee
      @employee = Employee.find(params[:id])
    end

    def employee_params
      params.permit(employee:[:first_name, :last_name, :position, :email, :twitter, :linkedin, :image, :company_id])
    end
end
