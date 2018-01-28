class ProductsController < ApplicationController
  before_action :find_product, only: [:show, :edit, :update, :destroy]

  def index
    @all_products = Product.all
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)

    if @product.save
      redirect_to product_path(@product)
    else
      render 'new'
    end
  end

  def show
  end

  def edit
  end

  def update
    @product.update(product_params)
    if @product.save
      redirect_to product_path(@product)
    else
      render 'edit'
    end
  end

  private

  def product_params
    params.require(:product).permit(:name, :brand_tokens, :capacity, :ingredient_tokens)
  end

  def find_product
    @product = Product.find(params[:id])
  end
end
