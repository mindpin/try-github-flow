FactoryGirl.define do
  factory :order_1, :class => Order do
    total 1000
    association :user, factory: :user_vip 
  end

  factory :order_2, :class => Order do
    total 1000 
    association :user, factory: :user_not_vip
  end 

  factory :user_vip, :class => User do
    is_vip true
  end

  factory :user_not_vip, :class => User do
    is_vip false
  end
end
