require 'rails_helper'

RSpec.describe SzqShanOrder, type: :model do
<<<<<<< HEAD
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
=======
  describe "#amount" do
    before do
        @user=User.new
        @order=SzqShanOrder.new(:user => @user, :total => 1000)
      end
    describe "是否vip" do
      it "是VIP会员" do
        @user.is_vip = true
        expect(@order.amount).to eq(900)
      end

      it "不是VIP会员" do
        @user.is_vip = false
        expect(@order.amount).to eq(1000)
      end
>>>>>>> 5a12a618c06b836e967735b5d795d572ce35b2df
    end
  end
end
