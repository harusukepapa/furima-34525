require 'rails_helper'

RSpec.describe Product, type: :model do
  before do
    @product = FactoryBot.build(:product)
  end

  describe '商品出品機能' do
    context '商品出品が登録できるとき' do
      it 'imageとproduct, product_description, category_id, condition_id, shipping_fee_id , shipping_area_id,shipping_time_id, priceが存在すれば登録できる' do
        expect(@product).to be_valid
      end
      it '販売価格は半角数字で登録できる' do
        @product.price = 123456
        @product.valid?
        expect(@product).to be_valid
      end
    end

    context '商品出品が登録できないとき' do
      it '商品画像が空では登録できない' do
        @product.image =  nil
        @product.valid?
        expect(@product.errors.full_messages).to include ("画像を入力してください")
      end
      it '商品名が空では登録できない' do
        @product.product = ''
        @product.valid?
        expect(@product.errors.full_messages).to include ("商品名を入力してください")
      end
      it '商品説明が空では登録できない' do
        @product.product_description = ''
        @product.valid?
        expect(@product.errors.full_messages).to include ("商品の説明を入力してください")
      end
      it 'カテゴリーが空では登録できない' do
        @product.category_id = ''
        @product.valid?
        expect(@product.errors.full_messages).to include ("カテゴリーを入力してください"), ("カテゴリーは数値で入力してください")
      end
      it 'カテゴリーは1以外でないと登録できない' do
        @product.category_id = 1
        @product.valid?
        expect(@product.errors.full_messages).to include ("カテゴリーは1以外の値にしてください")
      end
      it '商品の状態についての情報が空では登録できない' do
        @product.condition_id = ''
        @product.valid?
        expect(@product.errors.full_messages).to include ("商品の状態を入力してください"), ("商品の状態は数値で入力してください")
      end
      it '商品の状態は1以外でないと登録できない' do
        @product.condition_id = 1
        @product.valid?
        expect(@product.errors.full_messages).to include ("商品の状態は1以外の値にしてください")
      end
      it '配送料の負担についての情報が空では登録できない' do
        @product.shipping_fee_id = ''
        @product.valid?
        expect(@product.errors.full_messages).to include ("配送料の負担を入力してください"), ("配送料の負担は数値で入力してください")
      end
      it '配送料の負担は1以外でないと登録できない' do
        @product.shipping_fee_id = 1
        @product.valid?
        expect(@product.errors.full_messages).to include ("配送料の負担は1以外の値にしてください")
      end
      it '発送元の地域についての情報が空では登録できない' do
        @product.shipping_area_id = ''
        @product.valid?
        expect(@product.errors.full_messages).to include ("発送元の地域を入力してください"), ("発送元の地域は数値で入力してください")
      end
      it '発送元の地域は0以外でないと登録できない' do
        @product.shipping_area_id = 0
        @product.valid?
        expect(@product.errors.full_messages).to include ("発送元の地域は0以外の値にしてください")
      end
      it '発送までの日数についての情報が空では登録できない' do
        @product.shipping_time_id = ''
        @product.valid?
        expect(@product.errors.full_messages).to include ("発送までの日数を入力してください"), ("発送までの日数は数値で入力してください")
      end
      it '発送までの日数は1以外でないと登録できない' do
        @product.shipping_time_id = 1
        @product.valid?
        expect(@product.errors.full_messages).to include ("発送までの日数は1以外の値にしてください")
      end
      it '販売価格についての情報が空では登録できない' do
        @product.price = ''
        @product.valid?
        expect(@product.errors.full_messages).to include ("価格を入力してください"), ("価格は数値で入力してください")
      end
      it '販売価格は、¥300以下では登録できない' do
        @product.price = 299
        @product.valid?
        expect(@product.errors.full_messages).to include ("価格は299より大きい値にしてください")
      end
      it '販売価格は、¥10,000,000以上では登録できない' do
        @product.price = 10,000,000
        @product.valid?
        expect(@product.errors.full_messages).to include ("価格を入力してください")
      end
      it '販売価格は半角数字以外は登録できない' do
        @product.price = 'aaa'
        @product.valid?
        expect(@product.errors.full_messages).to include ("価格は数値で入力してください")
      end
      it '価格は全角文字では登録できないこと' do
        @product.price = 'あああ'
        @product.valid?
        expect(@product.errors.full_messages).to include ("価格は数値で入力してください")
      end
      it '価格は半角英数混合では登録できないこと' do
        @product.price = 'a123'
        @product.valid?
        expect(@product.errors.full_messages).to include ("価格は数値で入力してください")
      end
      it '価格は半角英語だけでは登録できないこと' do
        @product.price = 'aaa'
        @product.valid?
        expect(@product.errors.full_messages).to include ("価格は数値で入力してください")
      end

    end
  end

end
