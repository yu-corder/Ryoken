class User < ApplicationRecord
    belongs_to :account, dependent: :destroy
    has_many :cookpost, dependent: :destroy
    has_many :likes, dependent: :destroy
    has_many :comments, dependent: :destroy

    validates :nickname, presence: {message: 'は、必須項目です'}, length: { maximum: 10 }, obscenity: { message: 'はNGワードになっています' }
    validates :profile, length: { maximum: 40 }, obscenity: { message: 'はNGワードになっています' }
    validates :account_id, :nickname, uniqueness: true
end