class BuyersController < ApplicationController
  before_action :authenticate_user!, only: [:index, :create]
  
  def index
    @product = Product.find(params[:product_id])
    @buyer_address = BuyerAddress.new
    if ( @product.user_id == current_user.id ) || @product.buyer.present?
      redirect_to root_path 
    end 
  end

  def create
    @buyer_address = BuyerAddress.new(buyer_params)
    @product = Product.find(params[:product_id])
    if @buyer_address.valid?
      pay_item
      @buyer_address.save
      redirect_to root_path
    else
      render :index
    end
  end
  
  private

  def buyer_params
    params.require(:buyer_address).permit(:postal_code, :shipping_area_id, :city, :house_number, :building_name, :phone_number, ).merge(user_id: current_user.id, product_id: params[:product_id], token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @product[:price],
      card: buyer_params[:token],  
      currency: 'jpy'
    )
  end
  
end
