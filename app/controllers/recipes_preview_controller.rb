class RecipesPreviewController < ApplicationController

  before_action :ensure_current_user

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

  alias_method :index, :create

  private

  def recipe_preview
    @recipe_preview ||= if params[:ingredients]
                          session[:last_search] = params[:ingredients]
                          RecipePreview.new(params[:ingredients])
                        else
                          RecipePreview.new(session[:last_search])
                        end
  end

  helper_method :recipe_preview

end