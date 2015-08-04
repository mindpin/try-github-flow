require 'rails_helper'

RSpec.describe SzqShanOrder, type: :model do
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
    end
  end
end
