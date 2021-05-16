class Cookpost < ApplicationRecord
    belongs_to :user
    has_many :likes, dependent: :destroy
    has_many :comments, dependent: :destroy
    mount_uploaders :images, ImageUploader
    validates :cooking_name, :ingredients, :cooking_recipe, presence: {message:'は、必須項目です。'}
end
