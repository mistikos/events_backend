FactoryGirl.define do
  factory :event do
    email { Faker::Internet.email }
    fullname { Faker::Name.name }
    password '12345678'
    password_confirmation '12345678'
    company_id '1'
  end

end
