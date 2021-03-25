require 'rails_helper'
RSpec.describe BuyerAddress, type: :model do
  before do
    user = FactoryBot.create(:user)
    product = FactoryBot.create(:product)
    @buyer_address = FactoryBot.build(:buyer_address,user_id: user.id, product_id: product.id)
    sleep 0.1
  end

  describe '商品購入機能' do

    context '商品購入が購入できるとき' do
      it 'postal_code, shipping_area_id, city, house_number, building_name, phone_number, user_id, product_id, tokenが存在すれば登録できる' do
        expect(@buyer_address).to be_valid
      end
      it '建物名は空でも保存できること' do
        @buyer_address.building_name = ''
        expect(@buyer_address).to be_valid
      end
      it '電話番号は10桁でも登録できる' do
        @buyer_address.phone_number = '0120123456'
        @buyer_address.valid?
      end
      
    end

    context '商品購入が購入できないとき' do

      it "tokenが空では登録できないこと" do
        @buyer_address.token = nil
        @buyer_address.valid?
        expect(@buyer_address.errors.full_messages).to include("クレジット情報を入力してください")
      end
      it "user_idが空では登録できないこと" do
        @buyer_address.user_id = nil
        @buyer_address.valid?
        expect(@buyer_address.errors.full_messages).to include("Userを入力してください")
      end
      it "product_idが空では登録できないこと" do
        @buyer_address.product_id = nil
        @buyer_address.valid?
        expect(@buyer_address.errors.full_messages).to include("Productを入力してください")
      end
      it '郵便番号が空だと保存できないこと' do
        @buyer_address.postal_code = ''
        @buyer_address.valid?
        expect(@buyer_address.errors.full_messages).to include ("郵便番号を入力してください"),("郵便番号は不正な値です")
      end
      it '郵便番号が半角のハイフンを含んだ正しい形式でないと保存できないこと' do
        @buyer_address.postal_code = '1234567'
        @buyer_address.valid?
        expect(@buyer_address.errors.full_messages).to include ("郵便番号は不正な値です")
      end
      it '都道府県についての情報が空では登録できない' do
        @buyer_address.shipping_area_id = ''
        @buyer_address.valid?
        expect(@buyer_address.errors.full_messages).to include ("都道府県は数値で入力してください")
      end
      it '発送元の地域は0以外でないと登録できない' do
        @buyer_address.shipping_area_id = 0
        @buyer_address.valid?
        expect(@buyer_address.errors.full_messages).to include ("都道府県は0以外の値にしてください")
      end
      it '市区町村ついての情報が空では登録できない' do
        @buyer_address.city = ''
        @buyer_address.valid?
        expect(@buyer_address.errors.full_messages).to include ("市町村を入力してください")
      end
      it '番地ついての情報が空では登録できない' do
        @buyer_address.house_number = ''
        @buyer_address.valid?
        expect(@buyer_address.errors.full_messages).to include ("番地を入力してください")
      end
      it '電話番号ついての情報が空では登録できない' do
        @buyer_address.phone_number = ''
        @buyer_address.valid?
        expect(@buyer_address.errors.full_messages).to include ("電話番号を入力してください"),("電話番号は不正な値です")
      end
      it '電話番号は11桁以内の数値でなければ登録できない' do
        @buyer_address.phone_number = '090123456789'
        @buyer_address.valid?
        expect(@buyer_address.errors.full_messages).to include ("電話番号は不正な値です")
      end
      it '電話番号は半角数字の数値でなければ登録できない' do
        @buyer_address.phone_number = '０９０１２３４５６７８'
        @buyer_address.valid?
        expect(@buyer_address.errors.full_messages).to include ("電話番号は不正な値です")
      end

    end
  end
end
