FactoryGirl.define do
  factory :location do
    city Faker::Address.city
  end
end
