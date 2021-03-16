class ProductsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show,]

  def index
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.create(product_params)
    if @product.save
      redirect_to root_path
    else 
      render :new
    end
  end


  private

  def product_params
    params.require(:product).permit(:image, :product, :product_description, :category_id, :condition_id, :shipping_fee_id, :shipping_area_id, :shipping_time_id, :price ).merge(user_id: current_user.id)
  end

  


end
