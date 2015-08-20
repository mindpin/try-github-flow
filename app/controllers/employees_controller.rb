class EmployeesController <ApplicationController

  def new
    @employee = Employee.new
    @company = Company.find(params[:company_id])
  end

  def index
    @employee = Employee.all
    @company = Company.find(params[:company_id])
  end

  def create
    @employee_name = params[:employee][:employee_name]
    @card_id = params[:employee][:card_id]
    @phone_num = params[:employee][:phone_num]
    @team_ids = params[:employee][:team_ids]
    @company_id = params[:company_id]
    p "111111111111111111111111111111111111111111111111"
    p @company_id
    @employee = Employee.create(employee_name: @employee_name, card_id: @card_id, phone_num: @phone_num, team_ids: @team_ids, company_id: @company_id)
    if @employee.save
      redirect_to "/companies/#{params[:company_id]}/employees"
    else
      redirect_to "/companies/#{params[:company_id]}/employees/new"
    end
  end

  def edit
    @employee = Employee.find(params[:id])
    @company = Company.find(params[:company_id])
  end

  def update
    @employee = Employee.find(params[:id])
    if @employee.update_attributes(params_employee)
      redirect_to "/companies/#{params[:company_id]}/employees"
    else
      redirect_to "/companies/#{params[:company_id]}/employees/#{params[:id]}/edit"
    end
  end

  def show
    @employee = Employee.find(params[:id])
  end

  def destroy
    @employee = Employee.find(params[:id])
    @employee.destroy
    redirect_to "/companies/#{params[:company_id]}/employees"
  end

  private
    def params_employee
      params.require(:employee).permit(:employee_name, :card_id, :phone_num, :company_id, :team_ids)
    end
end