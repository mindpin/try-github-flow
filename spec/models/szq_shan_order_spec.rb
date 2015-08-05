require 'rails_helper'

RSpec.describe SzqShanOrder, type: :model do
  describe "#amount" do 
    # before "是否VIP" do
      
      
    # end

    it "用户为VIP" do
      user  = create(:user_is_vip)
      @order = create(:order_shan,:user => user) 
      expect(@order.amount).to eq(900)
    end

    it "用户不为VIP" do
      user  = create(:user_not_vip)
      @order = create(:order_shan,:user => user) 
      expect(@order.amount).to eq(1000)
    end
  end
end
