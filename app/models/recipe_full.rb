class RecipeFull
  attr_reader :name, :large_photo, :small_photo, :rating, :yielding, :recipe_url, :ingredient_quantities

  def initialize(attributes)
    @name, @large_photo, @small_photo, @rating, @yielding, @recipe_url, @ingredient_quantities = attributes.values_at(
      :name, :large_photo, :small_photo, :rating, :yielding, :recipe_url, :ingredient_quantities
    )
  end
end