require 'rails_helper'

describe "verification member imformation", :type => :feature do
  it "成功创建" do
    @card_id = "123654987478596423"
    @name    = "jack"
    @phone_num     = "12345678912"
    visit '/members/new'
    within("#member") do
      fill_in 'member[card_id]', :with => @card_id
      fill_in 'member[name]', :with => @name
      fill_in 'member[phone_num]', :with => @phone_num
    end
    click_button 'Submit'
    expect(page).to have_content "insert into member"

    @member = Member.where(:card_id => @card_id).first
    expect(@member.name).to eq(@name)
    expect(@member.phone_num).to eq(@phone_num)
  end

  it "成功创建" do
    @card_id = "123654987478596424"
    @name    = nil
    @phone_num     = nil
    visit '/members/new'
    within("#member") do
      fill_in 'member[card_id]', :with => @card_id
      fill_in 'member[name]', :with => @name
      fill_in 'member[phone_num]', :with => @phone_num
    end
    click_button 'Submit'

    @member = Member.where(:card_id => @card_id).first
    expect(@member.name).to eq("")
    expect(@member.phone_num).to eq("")
  end

  it "创建失败" do
    @card_id = "123654987478596"
    @name    = nil
    @phone_num     = nil
    visit '/members/new'
    within("#member") do
      fill_in 'member[card_id]', :with => @card_id
      fill_in 'member[name]', :with => @name
      fill_in 'member[phone_num]', :with => @phone_num
    end
    click_button 'Submit'

    @member = Member.where(:card_id => @card_id).first
    expect(@member).to eq(nil)
  end

  it "创建失败" do
    @card_id = "123456789987654325"
    @name    = "j"
    @phone_num     = nil
    visit '/members/new'
    within("#member") do
      fill_in 'member[card_id]', :with => @card_id
      fill_in 'member[name]', :with => @name
      fill_in 'member[phone_num]', :with => @phone_num
    end
    click_button 'Submit'

    @member = Member.where(:card_id => @card_id).first
    expect(@member).to eq(nil)
  end

  it "创建失败" do
    @card_id = "123456789987654327"
    @name    = "jhone"
    @phone_num     = "123"
    visit '/members/new'
    within("#member") do
      fill_in 'member[card_id]', :with => @card_id
      fill_in 'member[name]', :with => @name
      fill_in 'member[phone_num]', :with => @phone_num
    end
    click_button 'Submit'

    @member = Member.where(:card_id => @card_id).first
    expect(@member).to eq(nil)
  end

  it "查询成功" do
    member = create(:user_date)
    member_one = create(:user_date_one)
    member_two = create(:user_date_two)
    member_three = create(:user_date_three)
    member_four = create(:user_date_four)
    visit '/members'
    expect(page).to have_css("table tr.name", :count => 5)
  end

  it "删除数据" do
    @name      = "黎明" 
    @card_id   = "698547895642587945"
    @phone_num = "13564258796"
    members    = Member.create(name: @name, card_id: @card_id, phone_num: @phone_num)
    @before_member_count = Member.count
    visit '/members'
    within("#member") do
      click_link "Destroy"
    end
    @after_member_count = Member.count
    expect(@before_member_count-1).to eq(@after_member_count)
  end
end
