require 'rails_helper'

RSpec.describe Account, type: :model do
    before do
        @account = build(:account)
    end

    describe 'バリデーション' do
        it 'emailとpasswordどちらも値が設定されていれば、ok' do
            expect(@account.valid?).to eq(true)
        end

        it 'emailが空だとNG' do
            @account.email = ''
            expect(@account.valid?).to eq(false)
        end

        it 'passwordが空だとNG' do
            @account.password = ''
            expect(@account.valid?).to eq(false)
        end
    end
end
