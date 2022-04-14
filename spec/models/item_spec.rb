require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品機能' do
    context '商品出品ができるとき' do
      it 'introduction,item_name,category,status,ship_from,item_value,delivery_charge,deys_to_shipが存在すれば保存できる' do
        expect(@item).to be_valid
      end
    end

    context '商品出品ができないとき' do
      it 'categoryが---の時保存ができない' do
        @item.category_id = Category.find_by_id 1
        @item.valid?
        expect(@item.errors.full_messages).to include ("Category can't be blank")
      end
      it 'statusが---の時保存ができない' do
        @item.status_id = Status.find_by_id 1
        @item.valid?
        expect(@item.errors.full_messages).to include ("Status can't be blank") 
      end
      it 'delivery_chargeが---の時保存ができない' do
        @item.delivery_charge_id = DeliveryCharge.find_by_id 1
        @item.valid?
        expect(@item.errors.full_messages).to include ("Delivery charge can't be blank") 
      end
      it 'ship_fromが---の時保存ができない' do
        @item.ship_from_id = ShipFrom.find_by_id 0
        @item.valid?
        expect(@item.errors.full_messages).to include ("Ship from can't be blank") 
      end
      it 'days_to_shipが---の時保存ができない' do
        @item.days_to_ship_id = DaysToShip.find_by_id 1
        @item.valid?
        expect(@item.errors.full_messages).to include ("Days to ship can't be blank") 
      end
      it 'introductionが空欄の時保存ができない' do
        @item.introduction = ''
        @item.valid?
        expect(@item.errors.full_messages).to include ("Introduction can't be blank") 
      end
      it 'item_valueが空欄の時保存ができない' do
        @item.item_value = ''
        @item.valid?
        expect(@item.errors.full_messages).to include ("Item value can't be blank") 
      end
      it 'item_valueが数字以外の時保存ができない' do
        @item.item_value = 'テスト'
        @item.valid?
        expect(@item.errors.full_messages).to include ("Item value is not a number") 
      end
      it 'item_valueが300円未満の時保存ができない' do
        @item.item_value = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include ("Item value must be greater than or equal to 300") 
      end
      it 'item_valueが9999999円より高い時保存ができない' do
        @item.item_value = '99999999'
        @item.valid?
        expect(@item.errors.full_messages).to include ("Item value must be less than or equal to 9999999") 
      end
      it 'imageが空欄の時保存ができない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include ("Image can't be blank") 
      end
    end
  end
end
