require 'rails_helper'
RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品機能' do
    context '商品出品がうまくいくとき' do
      it '全ての項目が揃っていれば出品できる' do
        expect(@item).to be_valid
      end
    end
    context '商品出品がうまくいかないとき' do
      it 'imageが空では登録できないこと' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it '商品名が空では商品出品できない' do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end
      it '商品の説明が空では商品出品できない' do
        @item.description = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Description can't be blank")
      end
      it '値段が空では商品出品できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it 'カテゴリーが空では商品出品できない' do
        @item.category_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end
      it '商品の状態が空では商品出品できない' do
        @item.item_condition_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Item condition can't be blank", 'Item condition is not a number')
      end
      it '配送料の負担が空では商品出品できない' do
        @item.delivery_fee_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery fee can't be blank", 'Delivery fee is not a number')
      end
      it '発送元の地域が空では商品出品できない' do
        @item.shipping_region = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping region can't be blank", 'Shipping region is not a number')
      end
      it '発送までの日数が空では登録できない' do
        @item.shipping_day_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping day can't be blank", 'Shipping day is not a number')
      end
      it '値段が300円未満では出品できない' do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include('Price must be greater than or equal to 300')
      end
      it '値段が9999999円を超えると出品できない' do
        @item.price = 10_000_000
        @item.valid?
        expect(@item.errors.full_messages).to include('Price must be less than or equal to 9999999')
      end
    end
  end
end
