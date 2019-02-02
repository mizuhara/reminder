FactoryBot.define do
  factory :user do
    sequence(:email) { |n| "testemail{n}@example.com" }
    sequence(:password) { |n| "testpassword{n}@example.com" }
  end
end
