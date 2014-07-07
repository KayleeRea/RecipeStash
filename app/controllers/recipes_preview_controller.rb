class RecipesPreviewController < ApplicationController
  def index
  end

  def new
  end

  def create
  end

  private

  def recipe_preview
    @recipe_preview ||= RecipePreview.new(params[:ingredients])
  end

  helper_method :recipe_preview

end