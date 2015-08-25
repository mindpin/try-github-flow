require "rails_helper"

describe "Verification employee imformation", :type => :feature do
  # Create employee succcess
  it "Create employee success" do
    @company_address = "San Francico America"
    @company_name = "google"
    @company = Company.create!(:company_name => @company_name, :company_address => @company_address)
    @employee_name = "jack"
    @card_id = "123456789987654321"
    @phone_num = "12345678998"
    visit "/companies/#{@company.id}/employees/new"
    within ("#employee") do
      fill_in "employee[employee_name]", :with => @employee_name
      fill_in "employee[card_id]", :with => @card_id
      fill_in "employee[phone_num]", :with => @phone_num 
    end
    click_button "Create Employee"

    @employee = Employee.where(:card_id => @card_id).first
    expect(@employee.employee_name).to eq(@employee_name)
    expect(@employee.phone_num).to eq(@phone_num)
  end

  # Create employee failure when the employee_name format is wrong
  it "Create employee failure" do
    @company_address = "San Francico Canada"
    @company_name = "oracle"
    @company = Company.create!(:company_name => @company_name, :company_address => @company_address)
    @employee_name = "j"
    @card_id = "123456789987654322"
    @phone_num = "12345678996"
    visit "/companies/#{@company.id}/employees/new"
    within ("#employee") do
      fill_in "employee[employee_name]", :with => @employee_name
      fill_in "employee[card_id]", :with => @card_id
      fill_in "employee[phone_num]", :with => @phone_num
    end
    click_button "Create Employee"

    @employee = Employee.where(:card_id => @card_id).first
    expect(@employee).to eq(nil)
  end 

  # Create employee failure when the card_id format is wrong
  it "Create employee failure" do
    @company_address = "San Francico Africa"
    @company_name = "Gold"
    @company = Company.create!(:company_name => @company_name, :company_address => @company_address)
    @employee_name = "johne"
    @card_id = "123456789987654"
    @phone_num = "12345678955"
    visit "/companies/#{@company.id}/employees/new"
    within ("#employee") do
      fill_in "employee[employee_name]", :with => @employee_name
      fill_in "employee[card_id]", :with => @card_id
      fill_in "employee[phone_num]", :with => @phone_num
    end
    click_button "Create Employee"

    @employee = Employee.where(:card_id => @card_id).first
    expect(@employee).to eq(nil)
  end 

  # Create employee failure when the phone_num format is wrong
  it "Create employee failure" do
    @company_address = "San Francico Africa"
    @company_name = "Gold Shan"
    @company = Company.create!(:company_name => @company_name, :company_address => @company_address)
    @employee_name = "johne"
    @card_id = "123456789987654325"
    @phone_num = "1234567"
    visit "/companies/#{@company.id}/employees/new"
    within ("#employee") do
      fill_in "employee[employee_name]", :with => @employee_name
      fill_in "employee[card_id]", :with => @card_id
      fill_in "employee[phone_num]", :with => @phone_num
    end
    click_button "Create Employee"

    @employee = Employee.where(:card_id => @card_id).first
    expect(@employee).to eq(nil)
  end

  # Query employee
  it "Query employee" do
    @company_address = "San Francico Africa"
    @company_name = "Gold Shan"
    @company = Company.create!(:company_name => @company_name, :company_address => @company_address)
    employee = create(:employee)
    employee_one = create(:employee_one)
    employee_two = create(:employee_two)
    employee_three = create(:employee_three)
    employee_four= create(:employee_four)
    visit "/companies/#{@company.id}/employees"

    expect(page).to have_css("ul li.employee", :count => 5)
  end  

  # Delete employee
  it "Delete employee" do
    @company_address = "San Francico Europe"
    @company_name = "Gold Shan"
    @company = Company.create!(:company_name => @company_name, :company_address => @company_address)
    @employee_name = "jackson"
    @card_id = "123456789987654658"
    @phone_num = "12345672564"
    @employee = Employee.create(:employee_name => @employee_name, :card_id => @card_id, :phone_num => @phone_num)
    @before_employee_count = Employee.count
    visit "/companies/#{@company.id}/employees"
    within ("#employee") do
      click_link "Destroy"
    end

    @after_employee_count = Employee.count
    expect(@before_employee_count-1).to eq(@after_employee_count)
  end
         
end