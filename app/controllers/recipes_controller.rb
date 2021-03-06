class RecipesController < ApplicationController
  def index 
    @recipe = Recipe.all
  end 
  
  def show
    @recipe = Recipe.find(params[:id])
  end
  def new
    @recipe = Recipe.new
    
  end
  def create
    @recipe = Recipe.new(recipe_params)
    @recipe.chef = Chef.first
    if @recipe.save
      flash[:sucess] = "Recipe was created successfully"
      redirect_to recipe_path(@recipe)
    else
      render 'new'
    end
  end
  
  private
  
  def recipe_params
    params.require(:recipe).permit(:name, :description)
  end

end
