require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品機能' do

    context '出品が出来る場合' do
      it '商品画像があれば出品できる' do
        expect(@item).to be_valid
      end
      it '商品名があれば出品できる' do
        expect(@item).to be_valid
      end
      it '商品の説明があれば出品できる' do
        expect(@item).to be_valid
      end
      it 'カテゴリーidが2〜11で選択されていれば出品できる' do
        expect(@item).to be_valid
      end
      it '商品の状態idが2〜7で選択されていれば出品できる' do
        expect(@item).to be_valid
      end
      it '配送料idが2〜3で選択されていれば出品できる' do
        expect(@item).to be_valid
      end
      it '発送元の地域idが2〜48で選択されていれば出品できる' do
        expect(@item).to be_valid
      end
      it '発送までの日数idが2〜4で選択されていれば出品できる' do
        expect(@item).to be_valid
      end
      it '価格が半角数値のみであれば出品できる' do
        @item.price = '123456'
        expect(@item).to be_valid
      end
      it '価格が¥300〜¥9,999,999の範囲であれば出品できる' do
        
      end
    end

    context '出品が出来ない場合' do
      it '商品画像がなければ出品できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it '商品名がなければ出品できない' do
        @item.title = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Title can't be blank")
      end
      it '商品の説明がなければ出品できない' do
        @item.description = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Description can't be blank")
      end
      it 'カテゴリーidが1の場合出品できない' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Category must be other than 1")
      end
      it '商品の状態idが1の場合出品できない' do
        @item.state_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("State must be other than 1")
      end
      it '配送料idが1の場合出品できない' do
        @item.fee_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Fee must be other than 1")
      end
      it '発送元の地域idが1の場合出品できない' do
        @item.area_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Area must be other than 1")
      end
      it '発送までの日数idが1の場合出品できない' do
        @item.day_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Day must be other than 1")
      end
      it '価格が平仮名・カタカナ・漢字・英字の場合出品できない' do
        @item.price = 'あいうえお'
        @item.price = 'アイウエオ'
        @item.price = '亜井于絵尾'
        @item.price = 'aiueo'
        @item.valid?
      end
      it '価格が¥300〜¥9,999,999の範囲でなければ出品できない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('User must exist')
      end
      it 'ユーザーが紐付いてなければ出品できない' do
        
      end
    end
  end
end
