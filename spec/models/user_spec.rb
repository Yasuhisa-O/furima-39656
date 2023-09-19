require 'rails_helper'

RSpec.describe User, type: :model do

  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録できるとき' do
      it '入力項目すべて存在すれば登録できる' do
      expect(@user).to be_valid
      end
    end

    context 'ユーザー新規登録' do
      it 'nicknameが空では登録できない' do
        user = FactoryBot.build(:user)
        user.nickname = ''
        user.valid?
        expect(user.errors.full_messages).to include("Nickname can't be blank")
      end

      it 'メールアドレスが必須であること' do
        user = FactoryBot.build(:user)
        user.email = ''
        user.valid?
        expect(user.errors.full_messages).to include("Email can't be blank")
      end

      it 'メールアドレスが一意性であること' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end

      it 'メールアドレスは、@を含む必要があること' do
        user = FactoryBot.build(:user)
        user.email = 'test'
        user.valid?
        expect(user.errors.full_messages).to include("Email is invalid")
      end

      it 'パスワードが必須であること' do
        user = FactoryBot.build(:user)
        user.password = ''
        user.valid?
        expect(user.errors.full_messages).to include("Password can't be blank")
      end

      it ' パスワードは、6文字以上での入力が必須であること' do
        user = FactoryBot.build(:user)
        user.password = 'test0'
        user.password_confirmation = 'test0'
        user.valid?
        expect(user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
      end

      it 'パスワードは、半角英数字混合での入力が必須であること' do
        user = FactoryBot.build(:user)
        user.password = '000000'
        user.password_confirmation = '000000'
        user.valid?
        expect(user.errors.full_messages).to include("Password is invalid")
      end

      it 'パスワードとパスワード（確認）は、値の一致が必須であること' do
        user = FactoryBot.build(:user)
        user.password = 'test00'
        user.password_confirmation = 'test01'
        user.valid?
        expect(user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end

      it 'お名前(全角)は、名前が必須であること' do
        user = FactoryBot.build(:user)
        user.first_name = ''
        user.valid?
        expect(user.errors.full_messages).to include("First name can't be blank")
      end

      it 'お名前(全角)は、名字が必須であること' do
        user = FactoryBot.build(:user)
        user.last_name = ''
        user.valid?
        expect(user.errors.full_messages).to include("Last name can't be blank")
      end

      it 'お名前(全角)の名前は、全角（漢字・ひらがな・カタカナ）での入力が必須であること' do
        user = FactoryBot.build(:user)
        user.first_name = 'test'
        user.valid?
        expect(user.errors.full_messages).to include("First name is invalid")
      end

      it 'お名前(全角)の名字は、全角（漢字・ひらがな・カタカナ）での入力が必須であること' do
        user = FactoryBot.build(:user)
        user.last_name = 'test'
        user.valid?
        expect(user.errors.full_messages).to include("Last name is invalid")
      end

      it 'お名前カナ(全角)は、名前が必須であること' do
        user = FactoryBot.build(:user)
        user.first_name_kana = ''
        user.valid?
        expect(user.errors.full_messages).to include("First name kana can't be blank")
      end

      it 'お名前カナ(全角)は、名字が必須であること' do
        user = FactoryBot.build(:user)
        user.last_name_kana = ''
        user.valid?
        expect(user.errors.full_messages).to include("Last name kana can't be blank")
      end

      it 'お名前カナ(全角)の名前は、全角（カタカナ）での入力が必須であること' do
        user = FactoryBot.build(:user)
        user.first_name_kana = 'test'
        user.valid?
        expect(user.errors.full_messages).to include("First name kana is invalid")
      end

      it 'お名前カナ(全角)の名字は、全角（カタカナ）での入力が必須であること' do
        user = FactoryBot.build(:user)
        user.last_name_kana = 'test'
        user.valid?
        expect(user.errors.full_messages).to include("Last name kana is invalid")
      end

      it '生年月日が必須であること' do
        user = FactoryBot.build(:user)
        user.birth_day = ''
        user.valid?
        expect(user.errors.full_messages).to include("Birth day can't be blank")
      end
    end
  end
end
