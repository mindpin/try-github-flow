describe "verification information", :type => :feature do
  it "成功创建" do
    visit '/szq_admin_adduser/new'
    within("#szqadminadduser") do
      fill_in 'cardId', :with => 123654987478596423
      fill_in 'name', :with => 'jack'
    end
    click_button 'Submit'
    expect(page).to have_content "create cardId and name successfully"

    within("#szqadminadduser") do
      fill_in 'tel', :with => 12345678912
      fill_in 'address', :with => 'zhichun Road,Haidian District, Beijing'
    end
    click_button 'Submit'
    expect(page).to have_content "success"

  end

  it "创建失败" do
    visit '/szq_admin_adduser/new'
    within("#szqadminadduser") do
      fill_in 'cardId', :with => 123654987
      fill_in 'name', :with => 'jack'
    end
    click_button 'Submit'
    expect(page).to have_content "ID number format is wrong"
  end


  it "创建失败" do
    visit '/szq_admin_adduser/new'
    within("#szqadminadduser") do
      fill_in 'cardId', :with => 123654987478596424
      fill_in 'name', :with => 'j'
    end
    click_button 'Submit'
  end

  it "创建失败" do
    visit '/szq_admin_adduser/new'
    within("#szqadminadduser") do
      fill_in 'cardId', :with => 123654987478596425
      fill_in 'name', :with => 'jack'
    end
    click_button 'Submit'

    within("#szqadminadduser") do
      fill_in 'tel', :with => 123456789
      fill_in 'address', :with => 'ZhiChun Road,HaiDian District,peking'
    end
    click_button 'Submit'
  end

  it "创建失败" do
    visit '/szq_admin_adduser/new'
    within("#szqadminadduser") do
      fill_in 'cardId', :with => 123654987478596426
      fill_in 'name', :with => 'jack'
    end
    click_button 'Submit'

    within("#szqadminadduser") do
      fill_in 'tel', :with => 12345678955
      fill_in 'address', :with => 'peking'
    end
    click_button 'Submit'
  end
end
