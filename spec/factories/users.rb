FactoryGirl.define do
  factory :user do
    name "Misha"
    email { "#{ name }@tut.by" }
    password '123456'
    password_confirmation { |u| u.password }
    sequence(:remember_me)
  end
end