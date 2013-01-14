FactoryGirl.define do
  factory :location do
    address "Rafieva 40, Minsk"
    name "House sister"
    sequence(:gmaps)
    sequence(:partner_id)
    sequence(:house_id)
    sequence(:head_id)
    sequence(:longitude)
    sequence(:latitude)
  end
end