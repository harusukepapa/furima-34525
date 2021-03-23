class ProductsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_product, only: [:edit, :show, :update, :destroy]
  before_action :move_to_index, only: [:edit, :update, :destroy]
  before_action :move_to_root, only: [:edit, :update]

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
  end

  def edit
  end

  def update
    if @product.update(product_params)
       redirect_to product_path
    else
      render :edit
    end
  end

  def destroy
    @product.destroy
    redirect_to root_path
  end



  private

  def product_params
    params.require(:product).permit(:image, :product, :product_description, :category_id, :condition_id, :shipping_fee_id, :shipping_area_id, :shipping_time_id, :price ).merge(user_id: current_user.id)
  end

  def set_product
    @product = Product.find(params[:id])
  end
  
  def move_to_index
    unless @product.user_id == current_user.id 
      redirect_to products_path
    end 
  end

  def move_to_root
    if @product.buyer.present?
      redirect_to root_path 
    end
  end

end
