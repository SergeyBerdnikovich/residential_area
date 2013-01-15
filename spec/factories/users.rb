FactoryGirl.define do
  factory :user do
    name "Misha"
    email { |u| "#{ u.name }@tut.by" }
    password '123456'
    password_confirmation { |u| u.password }
    sequence(:remember_me)

    after(:create) do |user|
      if User.all.size > 1
        user.role = Role.find_or_create_by_name('guest')
      else
        user.role = Role.find_or_create_by_name('admin')
      end
    end
  end
end