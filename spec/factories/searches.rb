FactoryGirl.define do
  factory :search do
    metadata { { city: Enums::Cities::ALL.sample } }

    user
  end
end
