require 'rails_helper'

RSpec.describe Like, type: :model do
    before do
        @like = build(:like)
    end

    describe 'バリデーション' do
        it 'user_id, cookpost_idの値が設定されていれば、ok' do
            expect(@like.valid?).to eq(true)
        end
    end
end
