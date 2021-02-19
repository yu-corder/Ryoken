class Cookpost < ApplicationRecord
    belongs_to :user

    validates :cooking_name, :ingredients, :cooking_recipe, presence: {message:'は、必須項目です。'}
end
