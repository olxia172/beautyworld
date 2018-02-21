class OpinionsController < ApplicationController
  before_action :find_product, only: [:create, :destroy]

  def create
    @opinion = current_user.opinions.new(opinion_params)
    @opinion.product = @product
    if @opinion.save
      redirect_to @product, notice: 'You successfully added an opinion'
    else
      flash.now.alert = 'Something went wrong. Check if all fields are properly completed'
      render 'products/show'
      Rails.logger.info("Błędy to: #{@opinion.errors.full_messages}")
    end
  end

  def destroy
    @opinion = Opinion.find(params[:id])
    @product = @opinion.product
    @opinion.destroy
    redirect_to @product, notice: 'You successfully deleted an opinion'
  end

private

  def opinion_params
    params.require(:opinion).permit(:title, :body, :rate, :hit, :buy_again)
  end

  def find_product
    @product = Product.find(params[:product_id])
  end
end
