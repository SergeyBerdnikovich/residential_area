FactoryGirl.define do
  factory :news do
    sequence(:user_id)
    title 'news 21'
    content "<h1>Hello</h1><br><script>alert('bugaga')</script>"
  end
end