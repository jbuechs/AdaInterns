FactoryGirl.define do
  factory :company do
    name "Company name"
  end

  factory :employee do
    first_name "Joe"
    last_name "Schmoe"
    position "Lead developer"
    association :company
  end

  factory :intern do
    first_name "Patty"
    last_name "Programmer"
    cohort 4
    email "#{first_name}#{last_name}@example.com"
    password "password"
    password_confirmation "password"
  end

end
