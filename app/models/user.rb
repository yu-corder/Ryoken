class User < ApplicationRecord
    belongs_to :account
    has_many :cook_post

    validates :nickname, presence: {message: 'は、必須項目です'}
    validates :account_id, :nickname, uniqueness: true
end
