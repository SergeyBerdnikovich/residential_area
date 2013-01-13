FactoryGirl.define do
  factory :phone_number do
    sequence(:head_id)
    sequence(:partner_id)
    number '123456'
  end
end