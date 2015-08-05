require 'rails_helper'

RSpec.describe Order, type: :model do
    # before do
    #   @user = User.new
    #   @order = @user.orders.new
    # end
  describe "amount"do

    it "是vip九折 "  do
      user  = create(:user_vip)
      order = create(:order_1)
      expect(order.amount).to eq(900)
    end

    it "不是vip全价 "  do
      user  = create(:user_not_vip)
      order = create(:order_2)
      expect(order.amount).to eq(1000)
    end

  end 
end