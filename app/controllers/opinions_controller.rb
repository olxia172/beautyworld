class OpinionsController < ApplicationController
  before_action :find_product, only: [:create, :destroy]

  def create
    @opinion = @product.opinions.new(opinion_params)
    @opinion.user_id = current_user.id
    if @opinion.save
      redirect_to product_path(@product), notice: "You successfully added an opinion"
    else
      flash.now.alert = "Something went wrong. Check if all fields are properly completed"
      render 'products/show'
    end
  end

  def destroy
    @opinion = Opinion.find(params[:id])
    @opinion.destroy
    redirect_to product_path(@product), notice: "You successfully deleted an opinion"
  end

private

  def opinion_params
    params.require(:opinion).permit(:title, :body)
  end

  def find_product
    @product = Product.find(params[:product_id])
  end
end
