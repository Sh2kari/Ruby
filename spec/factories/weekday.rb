FactoryGirl.define do
  factory :weekday do
    title { 'weekday' }
    date { Date.today }
  end
end
