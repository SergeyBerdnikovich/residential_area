FactoryGirl.define do
  factory :apartment do
    sequence(:house_id)
    title "good apartment"
    description "very good apartment"
    sequence(:cost)
    sequence(:space)
    sequence(:number_of_rooms)
    sequence(:residential)
  end
end