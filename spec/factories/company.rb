FactoryGirl.define do

  factory :company_date, class: Company do
    company_name      "xinlang"
    company_address   "ZhongGuanCun HaiDian Disrict Peking City"
  end

  factory :company_date_one, class: Company do
    company_name      "baidu"
    company_address   "ZhongGuanCun HaiDian Disrict Peking City"
  end

  factory :company_date_two, class: Company do
    company_name      "tengxun"
    company_address   "ZhongGuanCun HaiDian Disrict Peking City"
  end

  factory :company_date_three, class: Company do
    company_name      "alibaba"
    company_address   "HangZhou City ZheJiang Province"
  end

  factory :company_date_four, class: Company do
    company_name      "58tongcheng"
    company_address   "ShangDi HaiDian Disrict Peking City"
  end
end