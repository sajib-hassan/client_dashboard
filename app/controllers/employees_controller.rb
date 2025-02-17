require "employee_importer"

class EmployeesController < ApplicationController
  before_action :set_employee, only: %i[show edit update destroy]

  # GET /employees
  # GET /employees.json
  def index
    @employees = if params[:company_id].present?
      Employee.where(company_id: params[:company_id]).all
    else
      Employee.all
    end
  end

  # GET /employees/1
  # GET /employees/1.json
  def show
  end

  # GET /employees/new
  def new
    @employee = Employee.new
  end

  # GET /employees/1/edit
  def edit
  end

  # POST /employees
  # POST /employees.json
  def create
    @employee = Employee.new(employee_params)

    respond_to do |format|
      if @employee.save
        format.html { redirect_to(@employee, notice: "Employee was successfully created.") }
        format.json { render(:show, status: :created, location: @employee) }
      else
        format.html { render(:new) }
        format.json { render(json: @employee.errors, status: :unprocessable_entity) }
      end
    end
  end

  # PATCH/PUT /employees/1
  # PATCH/PUT /employees/1.json
  def update
    respond_to do |format|
      if @employee.update(employee_params)
        format.html { redirect_to(@employee, notice: "Employee was successfully updated.") }
        format.json { render(:show, status: :ok, location: @employee) }
      else
        format.html { render(:edit) }
        format.json { render(json: @employee.errors, status: :unprocessable_entity) }
      end
    end
  end

  # DELETE /employees/1
  # DELETE /employees/1.json
  def destroy
    @employee.destroy!
    respond_to do |format|
      format.html { redirect_to(employees_url, notice: "Employee was successfully destroyed.") }
      format.json { head(:no_content) }
    end
  end

  # POST /employees/import
  def import
    EmployeeImporter.new(params[:file]).call
    head(:ok)
  rescue EmployeeImporter::FileValidationError => e
    render(json: {error: "File structure is incorrect", detail: e.message}, status: :bad_request)
  rescue EmployeeImporter::InvalidFileError => e
    render(json: {error: e.message, detail: e.message}, status: :bad_request)
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_employee
    @employee = Employee.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def employee_params
    params.require(:employee).permit(:identifier, :first_name, :last_name, :company_id)
  end
end
