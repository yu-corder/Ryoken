FactoryBot.define do
  factory :user do
    sequence(:nickname) { |n| "TEST#{n}NICKNAME"}
    sequence(:profile) { |n| "TEST#{n}PROFILE"}
    account
  end
end
