require 'rails_helper'
require 'pry'

RSpec.describe EmployeesController, type: :controller do
  let(:employee) { FactoryGirl.create(:employee)}
  let(:company) { FactoryGirl.create(:company) }

  describe "GET 'new'" do
    it "render new view" do
      get :new
      expect(subject).to render_template :new
    end
    it "assigns a new employee as @employee" do
      get :new, id: employee.id
      expect(assigns(:employee)).to be_a_new(Employee)
    end
  end

  describe "GET 'edit'" do
    it "renders edit view" do
      get :edit, {id: employee.id}, employee_id: employee.id
      expect(subject).to render_template :edit
    end
    it "assigns the requested employee as @employee" do
      get :edit, {id: employee.id}, employee_id: employee.id
      expect(assigns(:employee)).to eq(employee)
    end
  end

  describe "POST 'create'" do
    let(:good_params) do
       {
        employee: {
          first_name: "Plain",
          last_name: "Jane",
          position: "Senior Developer",
          company_id: company.id
        }
      }
    end
    let(:bad_params) do
      {
       employee: {
         first_name: "",
         last_name: "Jane",
         position: "Senior Developer",
         company_id: company.id
       }
      }
    end
    context "valid create params" do
      it "redirect to admin page" do
        post :create, good_params
        expect(subject).to redirect_to admin_path
      end
      it "creates a new Employee" do
        expect {
          post :create, good_params
        }.to change(Employee, :count).by(1)
      end
    end
    # context "invalid create params" do
    #   it "assigns a newly created but unsaved employee as @employee" do
    #     post :create, bad_params
    #     expect(assigns(:employee)).to be_a_new(Employee)
    #   end
    #   it "render new template on error" do
    #     post :create, bad_params
    #     expect(subject).to render_template :new
    #   end
    # end
  end

  describe "PATCH 'update'" do
    let(:good_params) do
      { id: employee.id,
        employee: { first_name: "Josh"}}
    end
    let(:bad_params) do
      { id: employee.id,
        employee: { first_name: "" }}
    end
    context "with valid update params" do
      it "assigns the requested employee as @employee" do
        patch :update, good_params, employee_id: employee.id
        expect(assigns(:employee)).to eq(employee)
      end
      it "redirects to index page" do
        patch :update, good_params, employee_id: employee.id
        expect(subject).to redirect_to admin_path
      end
    end
    # context "with invalid update params" do
    #   it "assigns the employee as @employee" do
    #     patch :update, bad_params, employee_id: employee.id
    #     expect(assigns(:employee)).to eq(employee)
    #   end
    #   it "re-renders edit template" do
    #     patch :update, bad_params, employee_id: employee.id
    #     expect(subject).to render_template "edit"
    #   end
    # end
  end

  describe "DELETE 'destroy'" do
    let(:delete_params) {{ id: employee.id }}
    it "redirects to admin path" do
      delete :destroy, delete_params
      expect(subject).to redirect_to admin_path
    end
    it "deletes employee" do
      employee
      expect {
        delete :destroy, delete_params
      }.to change(Employee, :count).by(-1)
    end
  end
end
