require 'rails_helper'

RSpec.describe Cookpost, type: :model do
    
    before do
        @cookpost = build(:cookpost)
    end

    describe 'バリデーション' do
        it 'cooking_name, ingredients, cooking_recipeが設定されていればok' do
            expect(@cookpost.valid?).to eq(true)
        end

        it 'cooking_nameが空だとNG' do
            @cookpost.cooking_name = ''
            expect(@cookpost.valid?).to eq(false)
        end

        it 'ingredientsが空だとNG' do
            @cookpost.ingredients = ''
            expect(@cookpost.valid?).to eq(false)
        end

        it 'cooking_recipeが空だとNG' do
            @cookpost.cooking_recipe = ''
            expect(@cookpost.valid?).to eq(false)
        end

        it 'imageが空でもok' do
            @cookpost.images = ''
            expect(@cookpost.valid?).to eq(true)
        end

        
    end
end
