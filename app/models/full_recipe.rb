class FullRecipe

  def initialize(recipe_id)
    @recipe_id = recipe_id
  end

  def recipe_content
    response = Faraday.get(
      "http://api.yummly.com/v1/api/recipe/#{@recipe_id}",
      :_app_id => ENV['YUMMLY_ID'],
      :_app_key => ENV['YUMMLY_KEY'],
    )

    json_data = JSON.parse(response.body)
    large_photo = json_data["images"].map { |images| images["imageUrlsBySize"]["360"] }.first
    small_photo = json_data["images"].map { |images| images["imageUrlsBySize"]["90"] }.first
    ingredient_quantities = json_data["ingredientLines"].uniq
    rating = json_data["rating"]
    name = json_data["name"]
    yielding = json_data["yield"]
    recipe_url = json_data["source"]["sourceRecipeUrl"]
    RecipeFull.new(:name => name,
                             :large_photo => large_photo,
                             :small_photo => small_photo,
                             :yielding => yielding,
                             :rating => rating,
                             :ingredient_quantities => ingredient_quantities,
                             :recipe_url => recipe_url)
  end
end