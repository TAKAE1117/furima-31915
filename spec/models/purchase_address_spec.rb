require 'rails_helper'

RSpec.describe PurchaseAddress, type: :model do
  describe '商品購入機能' do
    before do
      @purchase_address = FactoryBot.build(:purchase_address)
    end

    context '商品を購入できる' do
      it '全ての値が含まれていれば購入できる' do
        expect(@purchase_address).to be_valid
      end

      it '郵便番号に半角数値と-が含まれていれば購入できる' do
        @purchase_address.postal_code = '123-9876'
        expect(@purchase_address).to be_valid
      end

      it '電話番号が半角数値と11桁以内であれば購入できる' do
        @purchase_address.phone_number = '09012345678'
        expect(@purchase_address).to be_valid
      end

      it '建物名が空でも購入できる' do
        @purchase_address.building_name = nil
        expect(@purchase_address).to be_valid
      end
    end

    context '商品を購入できない' do
      it '郵便番号が空であれば購入できない' do
        @purchase_address.postal_code = nil
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Postal code can't be blank")
      end

      it '郵便番号に平仮名が含まれていると購入できない' do
        @purchase_address.postal_code = 'あいうえお'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include('Postal code Postal code Input correctly')
      end

      it '郵便番号にカタカタが含まれていると購入できない' do
        @purchase_address.postal_code = 'アイウエオ'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include('Postal code Postal code Input correctly')
      end

      it '郵便番号に漢字が含まれていると購入できない' do
        @purchase_address.postal_code = '亜意于絵尾'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include('Postal code Postal code Input correctly')
      end

      it '郵便番号に英字が含まれていると購入できない' do
        @purchase_address.postal_code = 'aiueo'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include('Postal code Postal code Input correctly')
      end

      it '郵便番号に-が含まれていないと購入できない' do
        @purchase_address.postal_code = '1234567'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include('Postal code Postal code Input correctly')
      end

      it '都道府県のカテゴリーidが1の場合購入できない' do
        @purchase_address.prefecture_id = 1
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include('Prefecture must be other than 1')
      end

      it '市区町村が空であれば購入できない' do
        @purchase_address.municipality = nil
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Municipality can't be blank")
      end

      it '番地が空であれば購入できない' do
        @purchase_address.address = nil
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Address can't be blank")
      end

      it '電話番号が空であれば購入できない' do
        @purchase_address.phone_number = nil
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Phone number can't be blank")
      end

      it '電話番号に-が含まれていれば購入できない' do
        @purchase_address.phone_number = '090-1234-5678'
        @purchase_address.valid?
      end

      it '電話番号が11桁以内でなければ購入できない' do
        @purchase_address.phone_number = '090123456789'
        @purchase_address.valid?
      end

      it '電話番号が半角英数値金剛であれば購入できない' do
        @purchase_address.phone_number = '090abcd5678'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include('Phone number Phone number is invalid')
      end

      it 'user_idが空であれば購入できない' do
        @purchase_address.user_id = nil
        @purchase_address.valid?
      end

      it 'item_idが空であれば購入できない' do
        @purchase_address.item_id = nil
        @purchase_address.valid?
      end

      it 'tokenが空であれば購入できない' do
        @purchase_address.token = nil
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
end
