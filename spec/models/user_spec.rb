require 'rails_helper'
RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    #新規登録ができるとき
    it 'nicknameと,email, password, password_confirmation, last_name, first_name, last_name_kana,first_name_kana, birthdayが存在すれば登録できる' do
      expect(@user).to be_valid
    end
    it 'passwordは６文字以上で登録できる' do
      @user.password = 'a12345'
      @user.password_confirmation = 'a12345'
      expect(@user).to be_valid
    end
    #新規登録ができるとき
    #新規登録ができないとき
    it 'nicknameが空では登録できない' do
      @user.nickname = ''
      @user.valid?
      expect(@user.errors.full_messages).to include ("Nickname can't be blank")
    end
    it 'emailが空では登録できない' do
      @user.email = ''
      @user.valid?
      expect(@user.errors.full_messages).to include ("Email can't be blank")
    end
    it 'emailは一意性であること' do
      @user.save
      another_user = FactoryBot.build(:user)
      another_user.email = @user.email
      another_user.valid?
      expect(another_user.errors.full_messages).to include('Email has already been taken')
    end
    it 'emailは、@を含む必要がある' do
      @user.email = "aaa.com"
      @user.valid?
      expect(@user.errors.full_messages).to include ("Email is invalid")
    end
    it 'passwordが空では登録できない'do
      @user.password = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end
    it 'passwordが５文字以下だと登録できない' do
      @user.password = 'a1234'
      @user.password_confirmation = 'a1234'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
    end
    it 'passwordは半角英数字混合でなければ登録できない' do
      @user.password = "aaaaaa"
      @user.password_confirmation = 'aaaaaa'
      @user.valid? 
      expect(@user.errors.full_messages).to include("Password には英字と数字の両方を含めて設定してください")
    end
    it 'passwordは確認用含めて2回入力が必要' do
      @user.password_confirmation = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
    it 'passwordとpassword_confirmationは値が一致しなけば登録できない' do
      @user.password = 'a12345'
      @user.password_confirmation = 'a123456'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
    it 'last_nameが空だと登録できない' do
      @user.last_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name can't be blank")
    end
    it 'last_nameが全角（漢字・ひらがな・カタカナ）でないと登録できない' do
      @user.last_name = 'aaa'
      @user.valid?
      expect(@user.errors.full_messages).to include('Last name is invalid')
    end
    it 'first_nameが空だと登録できない' do
      @user.first_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("First name can't be blank")
    end
    it 'first_nameが全角（漢字・ひらがな・カタカナ）でないと登録できない' do
      @user.first_name = 'aaa'
      @user.valid?
      expect(@user.errors.full_messages).to include('First name is invalid')
    end
    it 'last_name_kanaが空だと登録できない' do
      @user.last_name_kana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name kana can't be blank")
    end
    it 'last_name_kanaが全角（カタカナ）でないと登録できない' do
      @user.last_name_kana = 'あああ'
      @user.valid?
      expect(@user.errors.full_messages).to include('Last name kana is invalid')
    end
    it 'first_name_kanaが空だと登録できない' do
      @user.first_name_kana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kana can't be blank")
    end
    it 'first_name_kanaが全角（カタカナ）でないと登録できない' do
      @user.first_name_kana = 'あああ'
      @user.valid?
      expect(@user.errors.full_messages).to include('First name kana is invalid')
    end
    it 'birthdayが空だと登録できない' do
      @user.birthday = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Birthday can't be blank")
    end
    #新規登録ができないとき
  end
end
