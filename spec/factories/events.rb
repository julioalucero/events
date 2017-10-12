FactoryGirl.define do
  factory :event do
    title { Faker::Lorem.sentence(3) }
    date { Faker::Date.between(Date.today, 15.days.from_now) }
    start_at { Faker::Number.between(0, 43200) } # 43200 is half a day
    end_at { Faker::Number.between(43200, 86400) }
    topics { Enums::Topics::ALL.sample(2) }

    location
  end
end
