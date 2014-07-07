class RecipePreview

  def initialize(ingredients)
    @ingredients = ingredients
  end

  def results
    response = Faraday.get(
      "http://api.yummly.com/v1/api/recipes",
      :_app_id => ENV['YUMMLY_ID'],
      :_app_key => ENV['YUMMLY_KEY'],
      :allowedIngredient => @ingredients
    )
    json_data = JSON.parse(response.body)
    recipes = json_data["matches"]
    output = []
    recipes.each do |recipe_hash|
      recipe_name = recipe_hash["recipeName"]
      id = recipe_hash["id"]
      image_url = recipe_hash.fetch("imageUrlsBySize", {})["90"]
      ingredients = recipe_hash["ingredients"]
      output << Recipe.new(:name => recipe_name,
                           :id => id, :image_url => image_url,
                           :ingredients => ingredients)


    end
    output
  end
end