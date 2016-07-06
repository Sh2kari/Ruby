FactoryGirl.define do
  factory :order do
    user
    weekday

    total_price 120
  end
end
