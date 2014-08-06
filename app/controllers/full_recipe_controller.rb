class FullRecipeController < ApplicationController

  before_action :ensure_current_user

  def show
    @id = params[:id]
  end

  private

  def full_recipe
    @full_recipe ||= FullRecipe.new(params[:id]).recipe_content
  end

  helper_method :full_recipe
end