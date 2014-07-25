class StashesController < ApplicationController
  respond_to :html, :json

  def index
    @stashes = current_user.stashes
    respond_with @stashes
  end

  def show
    @stash = current_user.stashes.find_by_yummly_id(params[:id])
    respond_with({stash: @stash})
  end

  def create
    @stash = current_user.stashes.create(stash_params)
    respond_with @stash
  end

  def destroy
    @stash = current_user.stashes.find_by_yummly_id(params[:id])
    @stash.destroy
    respond_with @stash
  end

  private
  def stash_params
    params.require(:stash).permit(:name, :yummly_id, :photo_url, :recipe_url, :ingredients => [])
  end
end
