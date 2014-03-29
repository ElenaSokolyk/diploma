FactoryGirl.define do
  factory :user do
    sequence(:email) { |n| "user#{n}@user.com" }
    password { 'password' }
    password_confirmation { 'password' }
  end
end