require 'rails_helper'

RSpec.describe SzqAdminAdduser, type: :model do
  describe "verification information", :type => :feature do
    it "verification cardId and name" do
      visit '/szqadminadduser/new'
      within("#szqadminadduser") do      
        fill_in 'cardId', :with => 123456789987654321
        fill_in 'name', :with => 'jack'
        fill_in 'tel', :with => 12345678912
        fill_in 'address', :with => 'city peking'
      end
      click_button 'Submit'
      expect(page).to have_content "create user successfully"
    end
  end
end
