require 'rails_helper'

RSpec.describe User, type: :model do
    before do
        @user = build(:user)
    end

    describe 'バリデーション' do
        it 'nicknameの値が設定されていれば、ok' do
            expect(@user.valid?).to eq(true
        end

        it 'nicknameが空だとNG' do
            @user.nickname = ''
            expect(@user.valid?).to eq(false)
        end

        it 'profileが空でもok' do
            @user.profile= ''
            expect(@user.valid?).to eq(true)
        end

        
    end
end
