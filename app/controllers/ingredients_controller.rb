class IngredientsController < ApplicationController
  before_action :load_current_function
  before_action :find_ingredient, only: [:show, :edit, :update, :destroy]
  helper_method :letter_sort_param, :function_sort_param

  def index
    @all_ingredients = Ingredient.count
    # Rails.logger.info "Letter param to: #{letter_sort_param.inspect}"
    # Rails.logger.info "Function param to: #{function_sort_param.inspect}"
    if letter_sort_param
      @ingredients = Ingredient.where("name like ?", "#{letter_sort_param}%")
    elsif @function
      @ingredients = @function.ingredients.order(name: :asc)
    else
      @ingredients = Ingredient.all.order(name: :asc)
    end
    @functions = IngredientFunction.all.order(name: :asc)

    respond_to do |format|
      format.html
      format.json do
        render json: @ingredients.where("name ilike ?", "%#{params[:q]}%").limit(10).order(name: :asc)
      end
    end
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

  def letter_sort_param
    params[:sign] if params[:sign] && params[:sign].length == 1
  end

  def function_sort_param
    params[:function]
  end

  def load_current_function
    @function = IngredientFunction.find(function_sort_param) if function_sort_param
  end
end
