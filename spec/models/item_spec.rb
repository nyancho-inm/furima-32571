require 'rails_helper'
RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe "商品の保存" do
    context "出品できる場合"do
      it "image,description,category_id,condition_id,fee_id,area_id,day_id,priceがあれば出品できる" do
        expect(@item).to be_valid
      end
      it "priceが半角数字なら出品できる" do
        @item.price = "12345"
        expect(@item).to be_valid
      end
      it "priceが300以上なら出品できる" do
        @item.price = "300"
        expect(@item).to be_valid
      end
      it "priceが999999以下なら出品できる" do
        @item.price = "9999999"
        expect(@item).to be_valid
      end
    end
    context "出品できない場合" do
      it "imageが空では登録できない" do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include "Image can't be blank"
      end
      it "item_nameが空では登録できない" do
        @item.item_name = nil
        @item.valid?
        expect(@item.errors.full_messages).to include "Item name can't be blank"
      end
      it "descriptionが空では登録できない" do
        @item.description = nil
        @item.valid?        
        expect(@item.errors.full_messages).to include "Description can't be blank"
      end
      it "category_idが空では登録できない" do
        @item.category_id = nil
        @item.valid?        
        expect(@item.errors.full_messages).to include "Category Select"
      end
      it "condition_idが空では登録できない" do
        @item.condition_id = nil
        @item.valid?        
        expect(@item.errors.full_messages).to include "Condition Select"
      end
      it "fee_idが空では登録できない" do
        @item.fee_id = nil
        @item.valid?     
        expect(@item.errors.full_messages).to include "Fee Select"
      end
      it "area_idが空では登録できない" do
        @item.area_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include "Area Select"
      end
      it "day_idが空では登録できない" do
        @item.day_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include "Day Select"
      end
      it "priceが空では登録できない" do
        @item.price = nil
        @item.valid?
        expect(@item.errors.full_messages).to include "Price can't be blank"
      end
      it "priceが全角では登録できない" do
        @item.price = "１２３４５"
        @item.valid?
        expect(@item.errors.full_messages).to include "Price Out of setting range"
      end
      it "priceが299以下では登録できない" do
        @item.price = "299"
        @item.valid?
        expect(@item.errors.full_messages).to include "Price Out of setting range"
      end
      it "priceが10000000以上では登録できない" do
        @item.price = "10000000"
        @item.valid?
        expect(@item.errors.full_messages).to include "Price Out of setting range"
      end
    end
  end
  
end
