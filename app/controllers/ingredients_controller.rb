class IngredientsController < ApplicationController
  before_action :load_current_function
  before_action :find_ingredient, only: [:show, :edit, :update, :destroy]
  helper_method :letter_filter_param, :function_filter_param

  def index
    @all_ingredients = Ingredient.count
    @search_ingredients = Ingredient.search(params[:search])
    # Rails.logger.info "Letter param to: #{letter_filter_param.inspect}"
    # Rails.logger.info "Function param to: #{function_filter_param.inspect}"
    @functions = IngredientFunction.all.order(name: :asc)
    @ingredients = Ingredient.all
    filtration
    ingedient_tokens_for_form
  end

  def show
  end

  def edit
  end

  def update
    if @ingredient.update(ingredient_params)
      redirect_to ingredient_path(@ingredient)
    else
      render 'edit'
    end
  end

  def destroy
    @ingredient.destroy
    redirect_to ingredients_path
  end

private

  def find_ingredient
    @ingredient = Ingredient.find(params[:id])
  end

  def ingredient_params
    params.require(:ingredient).permit(:name, ingredient_function_ids: [])
  end

  def letter_filter_param
    params[:sign] if params[:sign] && params[:sign].length == 1
  end

  def function_filter_param
    params[:function]
  end

  def load_current_function
    @function = IngredientFunction.find(function_filter_param) if function_filter_param
  end

  def filtration
    if letter_filter_param
      @ingredients = Ingredient.where("name like ?", "#{letter_filter_param}%").order(:name).page(params[:page]).per(30)
    elsif @function
      @ingredients = @function.ingredients.order(:name).page(params[:page]).per(30)
    else
      @ingredients = Ingredient.order(:name).page(params[:page]).per(30)
    end
  end

  def ingedient_tokens_for_form
    respond_to do |format|
      format.html
      format.json do
        render json: @ingredients.where("name ilike ?", "%#{params[:ingr]}%").limit(10)
      end
    end
  end
end
