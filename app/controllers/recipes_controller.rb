#class RecipesController < ApplicationController
#
#  def index
#    @recipes = Recipe.all
#  end
#
#  def new
#    @recipe = Recipe.new
#  end
#
#  def create
#    @recipe = PreviewRecipe.create(recipe_params)
#    #ingredient_1 = params[:ingredient_1]
#    #
#    #RecipePreview.new(ingredient_1).calculate
#    #@preview_hash = #==> hash
#    request = Faraday.get("http://api.yummly.com/v1/api/recipes?_app_id=#{ENV['YUMMLY_ID']}&_app_key=#{ENV['YUMMLY_KEY']}&allowedIngredient[]=#{recipe_params[:ingredient1]}")
#    p JSON.parse(request.body)
#
#
#    redirect_to recipes_path
#  end
#
#  def show
#    @recipe = Recipe.find_by(params[:id])
#    p @recipe
#  end
#
#  private
#
#  def recipe_params
#    params.require(:recipe).permit(:ingredient1, :ingredient2, :ingredient3)
#  end
#end