class RecipesPreviewController < ApplicationController
  def index
  end

  def new
  end

  def create
    if recipe_preview.results.empty?
      flash.now[:no_results] = "Please check your spelling or choose different ingredients"
      render :new
    else
      render :create
    end
  end

  private

  def recipe_preview
    @recipe_preview ||= RecipePreview.new(params[:ingredients])
  end

  helper_method :recipe_preview

end