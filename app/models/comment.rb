class Comment < ApplicationRecord
    belongs_to :user
    belongs_to :cookpost
    validates :content, presence: {message:'は、必須項目です。'}, obscenity: { message: 'にNGワードが含まれています。' }
end
