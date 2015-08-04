require 'rails_helper'

RSpec.describe ZhouJianbinOrder, type: :model do
  describe "#amount" do
    it "是vip用户, 打九折" do
      user = User.new(:is_vip => true)
      zhou_jianbin_order = ZhouJianbinOrder.new( :user => user, :total => 1000 )
      expect(zhou_jianbin_order.amount).to eq(900)
    end

    it "非vip用户， 不打折" do
      user = User.new(:is_vip => false)
      zhou_jianbin_order = ZhouJianbinOrder.new(:user => user, :total => 1000)
      expect(zhou_jianbin_order.amount).to eq(1000)
    end
  end
end
