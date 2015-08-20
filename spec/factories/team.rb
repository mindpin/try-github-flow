FactoryGirl.define do 
  factory :team_one, class: Team do
    team_name "hugo"
  end

  factory :team_two, class: Team do 
    team_name "HaXia"
  end

  factory :team_three, class: Team do 
    team_name "Peters"
  end 

  factory :team_four, class: Team do
    team_name "Waiter"
  end

  factory :team_five, class: Team do 
    team_name "Waitress"
  end
end