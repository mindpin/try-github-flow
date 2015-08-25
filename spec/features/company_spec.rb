require "rails_helper"

describe "verification company imformation", :type => :feature do
  # successful create company
  it "create company success" do
    @company_name = "oracle"
    @company_address = "America New York"
    visit "/companies/new"
    within ("#company") do
      fill_in "company[company_name]", :with => @company_name
      fill_in "company[company_address]", :with => @company_address
    end
    click_button "Create Company"

    @company = Company.where( :company_name => @company_name).first
    expect(@company.company_address).to eq(@company_address)
  end

  # When the company_name and company_address is nil
  it "create company failure" do
    @company_name = nil
    @company_address = nil
    visit "/companies/new"
    within ("#company") do
      fill_in "company[company_name]", :with => @company_name
      fill_in "company[company_address]", :with => @company_address
    end
    click_button "Create Company"

    @company = Company.where( :company_name => @company_name).first
    expect(@company).to eq(nil)
  end

  # When the company_name is nil
  it "create company failure" do
    @company_name = nil
    @company_address = "ZhiChun Road HaiDian District and Peking city"
    visit "/companies/new"
    within ("#company") do
      fill_in "company[company_name]", :with => @company_name
      fill_in "company[company_address]", :with => @company_address
    end
    click_button "Create Company"

    @company = Company.where( :company_name => @company_name).first
    expect(@company).to eq(nil)
  end

  # When the company_address is nil
  it "create company failure" do
    @company_name = "johne"
    @company_address = nil
    visit "/companies/new"
    within ("#company") do
      fill_in "company[company_name]", :with => @company_name
      fill_in "company[company_address]", :with => @company_address
    end
    click_button "Create Company"

    @company = Company.where( :company_name => @company_name).first
    expect(@company).to eq(nil)
  end

  # When the company_name length is not right
  it "create company failure" do
    @company_name = "j"
    @company_address = "Nationality is China"
    visit "/companies/new"
    within ("#company") do
      fill_in "company[company_name]", :with => @company_name
      fill_in "company[company_address]", :with => @company_address
    end
    click_button "Create Company"

    @company = Company.where( :company_name => @company_name).first
    expect(@company).to eq(nil)
  end

  # When the company_address length is not right
  it "create company failure" do
    @company_name = "jack"
    @company_address = "Nation"
    visit "/companies/new"
    within ("#company") do
      fill_in "company[company_name]", :with => @company_name
      fill_in "company[company_address]", :with => @company_address
    end
    click_button "Create Company"

    @company = Company.where( :company_name => @company_name).first
    expect(@company).to eq(nil)
  end

  # Query all company imformation
  it "Query all company imformation" do
    company = create(:company_date)
    company_one = create(:company_date_one)
    company_two = create(:company_date_two)
    company_three = create(:company_date_three)
    company_four = create(:company_date_four)
    visit "/companies"
    expect(page).to have_css("ul li.company", :count => 5 )
  end  

  # Destroy a company imformation
  it "Destroy a company imformation" do
    @company_name = "google"
    @company_address = "San Francisco America"
    company = Company.create(company_name: @company_name, company_address: @company_address)
    @before_company_count = Company.count
    visit "/companies"
    within ("#company") do
      click_link "Destroy"
    end
    @after_company_count = Company.count
    expect(@after_company_count).to eq(@before_company_count-1)
  end
end