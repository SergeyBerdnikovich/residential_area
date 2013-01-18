FactoryGirl.define do
  factory :user do
    name "Misha"
    email { |n| "#{ n }@tut.by" }
    password '123456'
    password_confirmation { password }
    sequence(:remember_me)
  end
end