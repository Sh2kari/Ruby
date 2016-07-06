FactoryGirl.define do
  factory :user do
    profile

    name { Faker::Name.name }
    organization_id { 1 }
    email { Faker::Internet.email }
    password { '123456' }
    password_confirmation { '123456' }

    trait :admin do
      after(:create) {|user| user.add_role(:admin)}
    end
  end
end
