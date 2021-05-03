FactoryBot.define do
  factory :account do
    sequence(:email) { |n| "TEST#{n}@example.com"}
    sequence(:password) { |n| "TEST#{n}PASSWORD"}
  end
end
