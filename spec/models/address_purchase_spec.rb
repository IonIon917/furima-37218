require 'rails_helper'

RSpec.describe AddressPurchase, type: :model do
  before do
    @user = FactoryBot.create(:user)
    @item = FactoryBot.create(:item)
    @address_purchase = FactoryBot.build(:address_purchase, user_id: @user.id, item_id: @item.id)
  end

  describe '商品購入' do
    context '商品購入ができるとき' do
      it '郵便番号、都道府県、市区町村、番地、電話番号が正しく存在すれば購入できる' do
        expect(@address_purchase).to be_valid
      end
      it '建物名がからでも購入できる' do
        @address_purchase.building = ''
        expect(@address_purchase).to be_valid
      end
    end

    context '商品購入ができないとき' do
      it '郵便番号が空では購入できない' do
        @address_purchase.post_code = ''
        @address_purchase.valid?
        expect(@address_purchase.errors.full_messages).to include("Post code can't be blank")
      end
      it '都道府県が空では購入できない' do
        @address_purchase.ship_from_id = ShipFrom.find_by_id 0
        @address_purchase.valid?
        expect(@address_purchase.errors.full_messages).to include ("Ship from can't be blank") 
      end
      it '市区町村が空では購入できない' do
        @address_purchase.city = ''
        @address_purchase.valid?
        expect(@address_purchase.errors.full_messages).to include ("City can't be blank") 

      end
      it '番地が空では購入できない' do
        @address_purchase.house_number = ''
        @address_purchase.valid?
        expect(@address_purchase.errors.full_messages).to include ("House number can't be blank")

      end
      it '電話番号が空では購入できない' do
        @address_purchase.tell = ''
        @address_purchase.valid?
        expect(@address_purchase.errors.full_messages).to include ("Tell can't be blank")

      end
      it '郵便番号が「3桁ハイフン4桁」の半角文字列以外では購入できない' do
        @address_purchase.post_code = '1234567'
        @address_purchase.valid?
        expect(@address_purchase.errors.full_messages).to include ("Post code is invalid. Enter it as follows (e.g. 123-4567)")
      end
      it '電話番号が9桁以内では購入できない' do
        @address_purchase.tell = '12345678'
        @address_purchase.valid?
        expect(@address_purchase.errors.full_messages).to include ("Tell is invalid. Input only number")
      end
      it '電話番号が12桁以上では購入できない' do
        @address_purchase.tell = '1234567890123'
        @address_purchase.valid?
        expect(@address_purchase.errors.full_messages).to include ("Tell is invalid. Input only number")
      end
      it '電話番号は数字のみでなければ購入できない' do
        @address_purchase.tell = 'abcdefghijk'
        @address_purchase.valid?
        expect(@address_purchase.errors.full_messages).to include ("Tell is invalid. Input only number")
      end
      it 'userが紐付いていなければ購入できない' do
        @address_purchase.user_id = nil
        @address_purchase.valid?
        expect(@address_purchase.errors.full_messages).to include ("User can't be blank")
      end
      it 'itemが紐づいていなければ購入できない' do
        @address_purchase.item_id = nil
        @address_purchase.valid?
        expect(@address_purchase.errors.full_messages).to include ("Item can't be blank")
      end
      it 'tokenが空では購入できない' do
        @address_purchase.token = ''
        @address_purchase.valid?
        expect(@address_purchase.errors.full_messages).to include ("Token can't be blank")
      end
    end
  end
end
