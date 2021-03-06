class RecipyFoodsController < ApplicationController
  def create
    foods = Food.find_by(name: recipy_foods_params[:food])
    recipe = Recipy.find(params[:recipy_id])
    ingredient = RecipyFood.new(food: foods, recipy: recipe, quantity: recipy_foods_params[:quantity])

    if ingredient.save
      flash[:success] = 'Ingredient added'
    else
      flash[:alert] = 'Something went wrong'
    end
    redirect_back(fallback_location: recipy_path(params[:recipy_id]))
  end

  def destroy
    @ingredient = RecipyFood.find(params[:id])
    @ingredient.destroy
    redirect_back(fallback_location: recipy_path(params[:recipy_id]))
  end

  private

  def recipy_foods_params
    params.require(:recipy_food).permit(:food, :quantity)
  end
end
