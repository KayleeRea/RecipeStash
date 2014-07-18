class Recipe
  attr_reader :name, :recipe_id, :image_url, :ingredients

  def initialize(attributes)
    @name, @recipe_id, @image_url, @ingredients = attributes.values_at(
      :name, :recipe_id, :image_url, :ingredients
    )
  end
end
