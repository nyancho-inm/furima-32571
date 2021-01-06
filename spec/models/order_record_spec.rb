require 'rails_helper'

RSpec.describe OrderRecord, type: :model do
  describe '購入情報の保存' do
    before do
      user = FactoryBot.create(:user)
      item = FactoryBot.create(:item)
      sleep 1
      @order_record = FactoryBot.build(:order_record, user_id: user.id, item_id: item.id)
    end

    context '保存できる場合' do
      it '全ての値が正しく入力されていれば保存できる' do
        expect(@order_record).to be_valid
      end
      it 'buildingは空でも登録できる' do
        @order_record.building = nil
        expect(@order_record).to be_valid
      end
    end
    context '保存できない場合' do
      it 'postalが空では保存できない' do
        @order_record.postal = nil
        @order_record.valid?
        expect(@order_record.errors.full_messages).to include "Postal can't be blank"
      end
      it 'postalにハイフンがないと保存できない' do
        @order_record.postal = 1234567
        @order_record.valid?
        expect(@order_record.errors.full_messages).to include "Postal is invalid. Include hyphen(-)"
      end
      it 'prefecture_idが0では保存できない' do
        @order_record.prefecture_id = 0
        @order_record.valid?
        expect(@order_record.errors.full_messages).to include "Prefecture Select"
      end
      it 'prefecture_idが空では保存できない' do
        @order_record.prefecture_id = nil
        @order_record.valid?
        expect(@order_record.errors.full_messages).to include "Prefecture Select"
      end
      it 'municipalitiesが空では保存できない' do
        @order_record.municipalities = nil
        @order_record.valid?
        expect(@order_record.errors.full_messages).to include "Municipalities can't be blank"
      end
      it 'addressが空では保存できない' do
        @order_record.address = nil
        @order_record.valid?
        expect(@order_record.errors.full_messages).to include "Address can't be blank"
      end
      it 'phoneが空では保存できない' do
        @order_record.phone = nil
        @order_record.valid?
        expect(@order_record.errors.full_messages).to include "Phone can't be blank"
      end
      it 'phoneにハイフンがあると保存できない' do
        @order_record.phone = '090-123-456'
        @order_record.valid?
        expect(@order_record.errors.full_messages).to include "Phone number Input only number"
      end
      it 'phoneが12桁以上だと保存できない' do
        @order_record.phone = '090123456789'
        @order_record.valid?
        expect(@order_record.errors.full_messages).to include
      end

      it 'phoneが数字のみでないと保存できない' do
        @order_record.phone = 'aaaaaaaaaaa'
        @order_record.valid?
        expect(@order_record.errors.full_messages).to include
      end

      it 'user_idが空では保存できない' do
        @order_record.user_id = nil
        @order_record.valid?
        expect(@order_record.errors.full_messages).to include "User can't be blank"
      end
      it 'item_idが空では保存できない' do
        @order_record.item_id = nil
        @order_record.valid?
        expect(@order_record.errors.full_messages).to include "Item can't be blank"
      end

      it 'tokenが空では保存できない' do
        @order_record.token = nil
        @order_record.valid?
        expect(@order_record.errors.full_messages).to include "Token can't be blank"
      end
    end
  end
end
