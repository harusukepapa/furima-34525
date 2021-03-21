class BuyersController < ApplicationController

  def index
    @product = Product.find(params[:product_id])
    @buyer_address = BuyerAddress.new
  end

  def create
    @buyer_address = BuyerAddress.new(buyer_params)
    @product = Product.find(params[:product_id])
    if @buyer_address.valid?
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

  

  
end
