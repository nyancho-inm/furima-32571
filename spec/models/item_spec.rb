require 'rails_helper'
RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe "商品の保存" do
    context "出品できる場合"do
      it "image,description,category_id,condition_id,fee_id,area_id,day_id,price,user_idがあれば出品できる" do
        expect(@item).to be_valid
      end
      it "priceが300以上なら出品できる" do
        @item.price = 300
        expect(@item).to be_valid
      end
      it "priceが999999以下なら出品できる" do
        @item.price = 9999999
        expect(@item).to be_valid
      end
    end
    context "出品できない場合" do
      it "imageが空では登録できない" do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include "出品画像を入力してください"
      end
      it "item_nameが空では登録できない" do
        @item.item_name = nil
        @item.valid?
        expect(@item.errors.full_messages).to include "商品名を入力してください"
      end
      it "descriptionが空では登録できない" do
        @item.description = nil
        @item.valid?        
        expect(@item.errors.full_messages).to include "商品の説明を入力してください"
      end
      it "category_idが空では登録できない" do
        @item.category_id = nil
        @item.valid?        
        expect(@item.errors.full_messages).to include "カテゴリーを選択してください"
      end
      it "condition_idが空では登録できない" do
        @item.condition_id = nil
        @item.valid?        
        expect(@item.errors.full_messages).to include "商品の状態を選択してください"
      end
      it "fee_idが空では登録できない" do
        @item.fee_id = nil
        @item.valid?     
        expect(@item.errors.full_messages).to include "配送料の負担を選択してください"
      end
      it "area_idが空では登録できない" do
        @item.area_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include "発送元の地域を選択してください"
      end
      it "day_idが空では登録できない" do
        @item.day_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include "発送までの日数を選択してください"
      end
      it "priceが空では登録できない" do
        @item.price = nil
        @item.valid?
        expect(@item.errors.full_messages).to include "販売価格を入力してください"
      end
      it "category_idが1では登録できない" do
        @item.category_id = 1
        @item.valid?     
        expect(@item.errors.full_messages).to include "カテゴリーを選択してください"
      end
      it "condition_idが1では登録できない" do
        @item.condition_id = 1
        @item.valid?        
        expect(@item.errors.full_messages).to include "商品の状態を選択してください"
      end
      it "fee_idが1では登録できない" do
        @item.fee_id = 1
        @item.valid?     
        expect(@item.errors.full_messages).to include "配送料の負担を選択してください"
      end
      it "area_idが1では登録できない" do
        @item.area_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include "発送元の地域を選択してください"
      end
      it "day_idが1では登録できない" do
        @item.day_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include "発送までの日数を選択してください"
      end
      it "priceが全角では登録できない" do
        @item.price = "１２３４５"
        @item.valid?
        expect(@item.errors.full_messages).to include "販売価格は半角数字で入力してください"
      end
      it "priceが299以下では登録できない" do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include "販売価格価格が設定範囲外です"
      end
      it "priceが10000000以上では登録できない" do
        @item.price = 10000000
        @item.valid?
        expect(@item.errors.full_messages).to include "販売価格価格が設定範囲外です"
      end
      it "userが紐づいていないと登録できない" do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include "ユーザー情報を入力してください"
      end
    end
  end
  
end
