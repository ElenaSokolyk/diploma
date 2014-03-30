FactoryGirl.define do
  factory :faculty do
    name      Faker::Name.name
    university
  end
end