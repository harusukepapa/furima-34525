class ProductsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show,]

  def index
    @products = Product.all.order("created_at DESC")
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to root_path
    else 
      render :new
    end
  end

  def show
    @product = Product.find(params[:id])
  end

  def edit
    @product = Product.find(params[:id])
    unless @product.user_id == current_user.id
      redirect_to products_path
    end
  end

  def update
    @product = Product.find(params[:id])
    if @product.update(product_params)
       redirect_to products_path
    else
      render :edit
    end
  end


  private

  def product_params
    params.require(:product).permit(:image, :product, :product_description, :category_id, :condition_id, :shipping_fee_id, :shipping_area_id, :shipping_time_id, :price ).merge(user_id: current_user.id)
  end

end
