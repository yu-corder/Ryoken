FactoryBot.define do
  factory :user do
    sequence(:nickname) { |n| "#{n}NAME"}
    sequence(:profile) { |n| "TEST#{n}PROFILE"}
    account
  end
end
