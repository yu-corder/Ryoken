class User < ApplicationRecord
    belongs_to :account, dependent: :destroy
    has_many :cookpost, dependent: :destroy
    has_many :likes, dependent: :destroy
    has_many :comments, dependent: :destroy

    validates :nickname, presence: {message: 'は、必須項目です'}
    validates :account_id, :nickname, uniqueness: true
end