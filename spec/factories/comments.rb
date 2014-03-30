FactoryGirl.define do
  factory :comment do
    association :commentable, factory: :article
    text        Faker::Lorem.paragraph
    user
  end
end