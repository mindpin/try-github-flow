require "rails_helper"

describe "verification team imformation", :type => :feature do
  #When the create success
  it "Verify that you create success" do 
    @company_name = "Yahoo"
    @company_address = "San Francisco America"
    @company = Company.create!(company_name: @company_name, company_address: @company_address)
    @team_name = "fireworke"
    visit "/companies/#{@company.id}/teams/new"
    within ("#team") do 
      fill_in "team[team_name]", :with => @team_name
    end
    click_button "Create Team"
    @team = Team.where(:team_name => @team_name).first
    expect(@team.team_name).to eq(@team_name)
  end

  #When the team name format is wrong
  it "Verify that you create failure" do
    @company_name = "Wa Sa nood"
    @company_address = "Washington city America"
    @company = Company.create!(company_name: @company_name, company_address: @company_address)
    @team_name = "f"
    visit "/companies/#{@company.id}/teams/new"
    within ("#team") do 
      fill_in "team[team_name]", :with => @team_name
    end
    click_button "Create Team"
    @team = Team.where(:team_name => @team_name).first
    expect(@team).to eq(nil)
  end

  #When the query team data
  it "verify query team data" do 
    @company_name = "TOSHIBA"
    @company_address = "Tokyo city Japan"
    @company = Company.create!(company_name: @company_name, company_address: @company_address)
    team_one =   create(:team_one)
    team_two =   create(:team_two)
    team_three = create(:team_three)
    team_four =  create(:team_four)
    team_five =  create(:team_five)
    visit "/companies/#{@company.id}/teams"

    expect(page).to have_css("ul li.team", :count => 5)
  end

  #When the destroy team data
  it "verify destroy team data" do
    @company_name = "HuaWei"
    @company_address = "city Peking,China"
    @company = Company.create!(company_name: @company_name, company_address: @company_address)
    @team_name = "fighting"
    @team = Team.create(:team_name => @team_name)
    @before_team_count = Team.count
    visit "/companies/#{@company.id}/teams"
    within ("#team") do
      click_link "Destroy"
    end
    @after_team_count = Team.count
    expect(@before_team_count-1).to eq(@after_team_count)
  end

end