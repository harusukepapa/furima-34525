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
        expect(@buyer_address.errors.full_messages).to include("Token can't be blank")
      end
      it "user_idが空では登録できないこと" do
        @buyer_address.user_id = nil
        @buyer_address.valid?
        expect(@buyer_address.errors.full_messages).to include("User can't be blank")
      end
      it "product_idが空では登録できないこと" do
        @buyer_address.product_id = nil
        @buyer_address.valid?
        expect(@buyer_address.errors.full_messages).to include("Product can't be blank")
      end
      it '郵便番号が空だと保存できないこと' do
        @buyer_address.postal_code = ''
        @buyer_address.valid?
        expect(@buyer_address.errors.full_messages).to include ("Postal code is invalid. Include hyphen(-)")
      end
      it '郵便番号が半角のハイフンを含んだ正しい形式でないと保存できないこと' do
        @buyer_address.postal_code = '1234567'
        @buyer_address.valid?
        expect(@buyer_address.errors.full_messages).to include ("Postal code is invalid. Include hyphen(-)")
      end
      it '都道府県についての情報が空では登録できない' do
        @buyer_address.shipping_area_id = ''
        @buyer_address.valid?
        expect(@buyer_address.errors.full_messages).to include ("Shipping area is not a number")
      end
      it '市区町村ついての情報が空では登録できない' do
        @buyer_address.city = ''
        @buyer_address.valid?
        expect(@buyer_address.errors.full_messages).to include ("City can't be blank")
      end
      it '番地ついての情報が空では登録できない' do
        @buyer_address.house_number = ''
        @buyer_address.valid?
        expect(@buyer_address.errors.full_messages).to include ("House number can't be blank")
      end
      it '電話番号ついての情報が空では登録できない' do
        @buyer_address.phone_number = ''
        @buyer_address.valid?
        expect(@buyer_address.errors.full_messages).to include ("Phone number can't be blank"),("Phone number is invalid")
      end
      it '電話番号は11桁以内の数値でなければ登録できない' do
        @buyer_address.phone_number = '090123456789'
        @buyer_address.valid?
        expect(@buyer_address.errors.full_messages).to include ("Phone number is invalid")
      end
      it '電話番号は半角数字の数値でなければ登録できない' do
        @buyer_address.phone_number = '０９０１２３４５６７８'
        @buyer_address.valid?
        expect(@buyer_address.errors.full_messages).to include ("Phone number is invalid")
      end

    end
  end
end
