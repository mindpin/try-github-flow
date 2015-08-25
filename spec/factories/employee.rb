FactoryGirl.define do
  factory :employee , class: Employee do
    employee_name "xianger"
    card_id "123652314578956821"
    phone_num "12365245631"
  end

  factory :employee_one, class: Employee do
    employee_name "shao"
    card_id "123652314578956824"
    phone_num "12365245635"
  end

  factory :employee_two, class: Employee do
    employee_name "LiLi"
    card_id "123652314578956825"
    phone_num "12365245636"
  end
  factory :employee_three, class: Employee do
    employee_name "xiangxiang"
    card_id "123652314578956826"
    phone_num "12365245637"
  end

  factory :employee_four, class: Employee do
    employee_name "LiXiang"
    card_id "123652314578956828"
    phone_num "12365245638"
  end
end