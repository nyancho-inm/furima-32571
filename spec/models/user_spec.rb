require 'rails_helper'
RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe "ユーザー新規登録" do
    context "新規登録できるとき" do
      it "nickname,email、password、password_confirmation、first_name、first_name_kana、last_name、last_name_kana、birthdayが存在すれば登録できる" do
        expect(@user).to be_valid
      end
      it "passwordとpassword_confirmationが6文字以上なら登録できる" do
        @user.password = "123aaa"
        @user.password_confirmation = "123aaa"
        expect(@user).to be_valid
      end
      it "passwordとpassword_confirmationが英数混合なら登録できる" do
        @user.password = "123aaa"
        @user.password_confirmation = "123aaa"
        expect(@user).to be_valid
      end
      it "first_name,last_name,first_name_kana,last_name_kanaが全角なら登録できる" do
        @user.first_name = "名前"
        @user.last_name = "名字"
        @user.first_name_kana = "ナマエ"
        @user.last_name_kana = "ミョウジ"
        expect(@user).to be_valid
      end
    end
    context "新規登録できないとき" do
      it "nicknameが空では登録できない" do  
        @user.nickname = ""
        @user.valid?
        expect(@user.errors.full_messages).to include "ニックネームを入力してください"
      end
      it "emailが空では登録できない" do
        @user.email = ""
        @user.valid?
        expect(@user.errors.full_messages).to include "Eメールを入力してください"
      end
      it "passwordが空では登録できない" do
        @user.password = ""
        @user.valid?
        expect(@user.errors.full_messages).to include "パスワードを入力してください"
      end
      it "passwordが存在してもpassword_confirmationが空では登録できない" do
        @user.password_confirmation = ""
        @user.valid?
        expect(@user.errors.full_messages).to include "パスワード（確認用）とパスワードの入力が一致しません"
      end
      it "first_nameが空では登録できない" do
        @user.first_name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include "名前を入力してください"
      end
      it "last_nameが空では登録できない" do
        @user.last_name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include "名字を入力してください"
      end
      it "first_name_kanaが空では登録できない" do
        @user.first_name_kana = ""
        @user.valid?
        expect(@user.errors.full_messages).to include "名前（仮名）を入力してください"
      end
      it "last_name_kanaが空では登録できない" do
        @user.last_name_kana = ""
        @user.valid?
        expect(@user.errors.full_messages).to include "名字（仮名）を入力してください"
      end
      it "birthdayが空では登録できない" do
        @user.birthday = ""
        @user.valid?
        expect(@user.errors.full_messages).to include "誕生日を入力してください"
      end
      it "重複したemailが存在する場合は登録できない" do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include "Eメールはすでに存在します"
      end
      it "emailに@がないと登録できない" do
        @user.email = "testgmail.com"
        @user.valid?
        expect(@user.errors.full_messages).to include "Eメールは不正な値です"
      end
      it "passwordとpassword_confirmationが一致しないと登録できない" do
        @user.password = "a123456"
        @user.password_confirmation = "a1234567"
        @user.valid?
        expect(@user.errors.full_messages).to include "パスワード（確認用）とパスワードの入力が一致しません"
      end
      it "passwordが5文字以下では登録できない" do
        @user.password = "12345"
        @user.password_confirmation = "12345"
        @user.valid?
        expect(@user.errors.full_messages).to include "パスワードは6文字以上で入力してください"
      end
      it "passwordとpassword_confirmationが英語だけでは登録できない" do
        @user.password = "aaaaaa"
        @user.password_confirmation = "aaaaaa"
        @user.valid?
        expect(@user.errors.full_messages).to include "パスワードは英語と数字を使用してください"
      end
      it "passwordとpassword_confirmationが数字だけでは登録できない" do
        @user.password = "123456"
        @user.password_confirmation = "123456"
        @user.valid?
        expect(@user.errors.full_messages).to include "パスワードは英語と数字を使用してください"
      end
      it "first_nameが半角では登録できない" do
        @user.first_name = "ﾅﾏｴ"
        @user.valid?
        expect(@user.errors.full_messages).to include "名前は全角で入力してください"
      end
      it "last_nameが半角では登録できない" do
        @user.last_name = "ﾐｮｳｼﾞ"
        @user.valid?
        expect(@user.errors.full_messages).to include  "名字は全角で入力してください"
      end
      it "first_name_kanaが半角では登録できない" do
        @user.first_name_kana = "ﾅﾏｴｶﾅ"
        @user.valid?
        expect(@user.errors.full_messages).to include "名前（仮名）は全角で入力してください"
      end
      it "last_name_kanaが半角では登録できない" do
        @user.last_name_kana = "ﾐｮｳｼｶﾅﾞ"
        @user.valid?
        expect(@user.errors.full_messages).to include  "名字（仮名）は全角で入力してください"
      end
    end
  end
end
