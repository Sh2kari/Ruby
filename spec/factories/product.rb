FactoryGirl.define do
  factory :product do
    weekday
    category

    title { Faker::Commerce.product_name }
    price { Faker::Commerce.price }
  end
end
