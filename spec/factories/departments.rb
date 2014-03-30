FactoryGirl.define do
  factory :department do
    name      Faker::Name.name
    faculty
  end
end