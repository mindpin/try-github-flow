require 'rails_helper'

describe "verification information", :type => :feature do
  it "成功创建" do
    @card_id = "123654987478596423"
    @name    = "jack"
    @tel     = "12345678912"
    @address = 'zhichun Road,Haidian District, Beijing'

    visit '/szq_admin_addusers/new'
    within("#szqadminadduser") do
      # szq_admin_adduser[card_id]  form_for表单中的默认方式
      fill_in 'szq_admin_adduser[card_id]', :with => @card_id
      fill_in 'szq_admin_adduser[name]', :with => @name
    end
    click_button 'Submit'
    expect(page).to have_content "create cardId and name successfully"

    within("#szqadminadduser") do
      fill_in 'szq_admin_adduser[tel]', :with => @tel
      fill_in 'szq_admin_adduser[address]', :with => @address
    end
    click_button 'Submit'
    expect(page).to have_content "success"


    @user = SzqAdminAdduser.where(:card_id => @card_id).first
    expect(@user.name).to eq(@name)
    expect(@user.tel).to eq(@tel)
    expect(@user.address).to eq(@address)

  end

  it "创建失败" do
    @card_id = "123654987"
    @name    = "jack"

    visit '/szq_admin_addusers/new'
    within("#szqadminadduser") do
      fill_in 'szq_admin_adduser[card_id]', :with => @card_id
      fill_in 'szq_admin_adduser[name]', :with => @name
    end
    click_button 'Submit'
    expect(page).to have_content "Add User Id and Name"

    @user = SzqAdminAdduser.where(:card_id => @card_id).first
    expect(@user).to eq(nil)
  end


  it "创建失败" do
    @card_id = "123654987478596424"
    @name    = "j"

    visit '/szq_admin_addusers/new'
    within("#szqadminadduser") do
      fill_in 'szq_admin_adduser[card_id]', :with => @card_id
      fill_in 'szq_admin_adduser[name]', :with => @name
    end
    click_button 'Submit'

    @user = SzqAdminAdduser.where(:card_id => @card_id).first
    expect(@user).to eq(nil)
  end

  it "创建失败" do
    @card_id = "123654987478596425"
    @name    = "jack"
    @tel     = "123456789"
    @address = "ZhiChun Road,HaiDian District,peking"

    visit '/szq_admin_addusers/new'
    within("#szqadminadduser") do
      fill_in 'szq_admin_adduser[card_id]', :with => @card_id
      fill_in 'szq_admin_adduser[name]', :with => @name
    end
    click_button 'Submit'

    within("#szqadminadduser") do
      fill_in 'szq_admin_adduser[tel]', :with => @tel
      fill_in 'szq_admin_adduser[address]', :with => @address
    end
    click_button 'Submit'

    @user = SzqAdminAdduser.where(:card_id => @card_id).first
    expect(@user.name).to eq(@name)
    expect(@user.tel).to eq(nil)
    expect(@user.address).to eq(nil)
  end

  it "创建失败" do
    @card_id = "123654987478596426"
    @name    = "jack"
    @tel     = "12345678955"
    @address = "peking"

    visit '/szq_admin_addusers/new'
    within("#szqadminadduser") do
      fill_in 'szq_admin_adduser[card_id]', :with => @card_id
      fill_in 'szq_admin_adduser[name]', :with => @name
    end
    click_button 'Submit'

    within("#szqadminadduser") do
      fill_in 'szq_admin_adduser[tel]', :with => @tel
      fill_in 'szq_admin_adduser[address]', :with => @address
    end
    click_button 'Submit'

    @user = SzqAdminAdduser.where(:card_id => @card_id).first
    expect(@user.name).to eq(@name)
    expect(@user.tel).to eq(nil)
    expect(@user.address).to eq(nil)
  end
end
