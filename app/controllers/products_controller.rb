class ProductsController < ApplicationController
  before_action :find_product, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]
  before_action :product_brand, only: [:create]

  helper_method :product_subcategory
  helper_method :product_brand

  def index
    load_products
    @products = @products.page(params[:page]).per(5)
  end

  def new
    if params[:subcategory_id]
      @product = Product.new(subcategory_id: params[:subcategory_id])
    elsif params[:brand_id]
      @product = Product.new(brand_id: params[:brand_id])
    else
      @product = Product.new
    end
    @product.sub_products.build
  end

  def create
    @product = current_user.products.new(product_params)
    binding.pry

    if @product.save
      redirect_to [@brand, @subcategory, @product].compact, notice: "You successfully added new product!"
    else
      flash.now.alert = "Something went wrong. Check if all fields are properly completed"
      render 'new'
      # Rails.logger.info("Błędy to: #{@product.errors.full_messages}")
    end
  end

  def show
    @opinion = Opinion.new
  end

  def edit
  end

  def update
    @product.update(product_params)
    if @product.save
      redirect_to product_path(@product), notice: "You successfully updated this product"
    else
      flash.now.alert = "Something went wrong. Check if all fields are properly completed"
      render 'edit'
    end
  end

  def destroy
    product_name = @product.name
    @product.destroy
    redirect_to products_path, notice: "You successfully deleted #{product_name}"
  end

  private

  def product_subcategory
    @subcategory ||= Subcategory.find(params[:subcategory_id]) if params[:subcategory_id]
  end

  def product_brand
    @brand ||= Brand.find(params[:brand_id]) if params[:brand_id]
  end

  def product_params
    params.require(:product).permit(:name, :capacity, :description, :brand_id, :subcategory_id, :ingredient_tokens, :image, sub_products_attributes: [:id, :name, :ingredient_tokens, :_destroy])
  end

  def find_product
    @product = Product.find(params[:id])
  end

  def load_products
    if product_subcategory
      @products = product_subcategory.products
    elsif product_brand
      @products = product_brand.products
    else
      @products = Product.all.order(:created_at)
    end
  end
end
