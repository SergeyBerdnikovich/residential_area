FactoryGirl.define do
  factory :house do
    title "mega dom 3"
    description "10 floors"
    sequence(:completed)
  end
end