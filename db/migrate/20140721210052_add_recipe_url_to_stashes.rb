class AddRecipeUrlToStashes < ActiveRecord::Migration
  def change
    add_column :stashes, :recipe_url, :string
  end
end
