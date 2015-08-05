FactoryGirl.define do
  factory :order_aa , class: Order do
    total 1000
  end

factory :user_is_vip ,class: User do
    is_vip true
  end

factory :user_is_not_vip ,class: User do
    is_vip false
  end

end
