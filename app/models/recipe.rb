class Recipe
  attr_reader :name, :id, :image_url, :ingredients

  def initialize(attributes)
    @name, @id, @image_url, @ingredients = attributes.values_at(
      :name, :id, :image_url, :ingredients
    )
  end
end
