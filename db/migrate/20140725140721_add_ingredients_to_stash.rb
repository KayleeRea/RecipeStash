class AddIngredientsToStash < ActiveRecord::Migration
  def change
    add_column :stashes, :ingredients, :text
  end
end
