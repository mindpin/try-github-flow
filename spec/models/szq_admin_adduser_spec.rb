require 'rails_helper'

RSpec.describe SzqAdminAdduser, type: :model do
  describe "the signin process", :type => :feature do
    it "signs me in" do
      visit '/szqadminadduser/new'
      within("#szqadminadduser") do      
        fill_in 'cardId', :with => 123456789987654321
        fill_in 'name', :with => 'jack'
        fill_in 'tel', :with => 13869996896
        fill_in 'address', :with => '北京市海淀区知春路锦秋国际B座904'
      end
      click_button 'Submmit'
      expect(page).to have_content 'Success'
    end
  end
end
