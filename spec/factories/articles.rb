FactoryGirl.define do
  factory :article do
    title   Faker::Name.name
    text    Faker::Lorem.paragraph
    user
  end
end