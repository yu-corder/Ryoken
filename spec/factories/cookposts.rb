FactoryBot.define do
  factory :cookpost do
    sequence(:cooking_name) { |n| "TEST#{n}COOKINGNAME"}
    sequence(:ingredients) { |n| "TEST#{n}INGREDIENTS"}
    sequence(:cooking_recipe) { |n| "TEST#{n}COOKING_RECIPE"}
    sequence(:images) { Rack::Test::UploadedFile.new(File.join(Rails.root, 'app/assets/images/mediterranean-cuisine-2378758_1920.jpg')) }
    sequence(:id) { |n| }
    user
  end
end
