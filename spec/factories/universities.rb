FactoryGirl.define do
  factory :university do
    name      Faker::Name.name
    address   Faker::Address.city
  end
end