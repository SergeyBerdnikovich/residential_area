FactoryGirl.define do
  factory :gallery do
    sequence(:house_id)
    sequence(:apartment_id)
    image_file_name '15d509c52429.jpeg'
    image_content_type 'image/jpg'
    image_file_size 1789
    image_updated_at '27:11:2012'
  end
end