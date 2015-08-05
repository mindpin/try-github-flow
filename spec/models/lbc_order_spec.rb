require 'rails_helper'

RSpec.describe Order, type: :model do
    # before do
    #   @user = User.new
    #   @order = @user.orders.new
    # end
  describe "amount"do

    it "是vip九折 "  do
      user =create(:user_is_vip)
      # (:is_vip =>true)
      # order=Order.new(:user=>user, :total=>1000)
      order=create(:order_aa,:user=>user)
      expect(order.amount).to eq(900)
    end

    it "不是vip全价 "  do
      # user = User.new(:is_vip =>false)
      # order=Order.new(:user=>user, :total=>1000)
      user =create(:user_is_not_vip)
      order=create(:order_aa,:user=>user)
      expect(order.amount).to eq(1000)
    end

  end
  
end