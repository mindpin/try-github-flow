FactoryGirl.define do

  factory :user_date, class: Member do
    name      "维维"
    card_id   "145236254563217812"
    phone_num "13566936658"
  end

  factory :user_date_one, class: Member do
    name      "周洁"
    card_id   "145236254563217813"
    phone_num "13566936659"
  end

  factory :user_date_two, class: Member do
    name      "郝明"
    card_id   "1452362545632178134"
    phone_num "13566936657"
  end

  factory :user_date_three, class: Member do
    name      "向里"
    card_id   "1452362545632178135"
    phone_num "13566936656"
  end

  factory :user_date_four, class: Member do
    name      "薇薇"
    card_id   "1452362545632178136"
    phone_num "13566936655"
  end

end
