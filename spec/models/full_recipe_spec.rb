require 'spec_helper'

describe FullRecipe do
 let(:valid_response) {
   {
     "attribution"=>{
     "html"=> "<a href='http://www.yummly.com/recipe/French-Onion-Soup-The-Pioneer-Woman-Cooks-_-Ree-Drummond-41364'>French Onion Soup recipe</a> information powered by <img alt='Yummly' src='http=>//static.yummly.com/api-logo.png'/>",
     "url"=> "http://www.yummly.com/recipe/French-Onion-Soup-The-Pioneer-Woman-Cooks-_-Ree-Drummond-41364",
     "text"=> "French Onion Soup recipes=> information powered by Yummly",
     "logo"=> "http://static.yummly.com/api-logo.png"
 },
   "ingredientLines"=> [
   "1 stick Butter",
   "4 whole Large (or 6 Medium) Yellow Onions, Halved Root To Tip, And Sliced Thin",
   "1 cup (generous) Dry White Wine",
   "4 cups Low Sodium Chicken Broth",
   "4 cups Beef Broth",
   "2 cloves Minced Garlic",
   "Worcestershire Sauce",
   "Several Thick Slices Of French Bread Or Baguette",
   "5 ounces, weight (to 7 Ounces) Gruyere Cheese, Grated"
 ],
   "flavors"=> {
   "Bitter"=> 0.3333333333333333,
   "Meaty"=> 0.16666666666666666,
   "Piquant"=> 0,
   "Salty"=> 0.6666666666666666,
   "Sour"=> 0.3333333333333333,
   "Sweet"=> 0.5
 },
   "images"=> [
   {
     "imageUrlsBySize"=> {
   "90"=> "http://lh3.ggpht.com/7t-vr_ARBxI2cXh852jSCWFPVClbnkMg5GBzOYO-dDfzxndJ6K_D4Kd_bgHxCx5RtfTRHQruO2ohqSsL_zOk=s90-c",
   "360"=> "http://lh3.ggpht.com/7t-vr_ARBxI2cXh852jSCWFPVClbnkMg5GBzOYO-dDfzxndJ6K_D4Kd_bgHxCx5RtfTRHQruO2ohqSsL_zOk=s360-c"
 },
   "hostedLargeUrl"=> "http://lh6.ggpht.com/Sn2qCFY3fG8cI71t9BdZ-Jyb9RyPh_0Dg79ii9iRNHhd97yQy5MYg0e9sun3HxY9inRax15XWkBSrQ3RCQGq0A=s360",
   "hostedSmallUrl"=> "http://lh6.ggpht.com/Sn2qCFY3fG8cI71t9BdZ-Jyb9RyPh_0Dg79ii9iRNHhd97yQy5MYg0e9sun3HxY9inRax15XWkBSrQ3RCQGq0A=s90"
 }
 ],
   "name"=> "French Onion Soup",
   "yield"=> "6",
   "totalTime"=> nil,
 "attributes"=> {
   "cuisine"=> [
   "French"
 ],
   "course"=> [
   "Soups",
   "Lunch and Snacks"
 ]
 },
   "totalTimeInSeconds"=> nil,
 "rating"=> 5,
   "numberOfServings"=> 6,
   "source"=> {
   "sourceRecipeUrl"=> "http://thepioneerwoman.com/cooking/2009/02/french-onion-soup/",
   "sourceSiteUrl"=> "http://thepioneerwoman.com",
   "sourceDisplayName"=> "The Pioneer Woman"
 },
   "id"=> "French-Onion-Soup-The-Pioneer-Woman-Cooks-_-Ree-Drummond-41364"
 }
 }
 before do
   stub_request(:get, "http://api.yummly.com/v1/api/recipe/French-Onion-Soup-The-Pioneer-Woman-Cooks-_-Ree-Drummond-41364?_app_id=#{ENV['YUMMLY_ID']}&_app_key=#{ENV['YUMMLY_KEY']}").
     to_return(:status => 200, :body => JSON(valid_response))
 end

  subject{FullRecipe.new("French-Onion-Soup-The-Pioneer-Woman-Cooks-_-Ree-Drummond-41364")}

  it 'requests the specifics of a recipe from the Yummly API' do
    recipe_object = subject.recipe_content
    recipe_object.name.should eq 'French Onion Soup'
    recipe_object.large_photo.should eq 'http://lh3.ggpht.com/7t-vr_ARBxI2cXh852jSCWFPVClbnkMg5GBzOYO-dDfzxndJ6K_D4Kd_bgHxCx5RtfTRHQruO2ohqSsL_zOk=s360-c'
    recipe_object.small_photo.should eq 'http://lh3.ggpht.com/7t-vr_ARBxI2cXh852jSCWFPVClbnkMg5GBzOYO-dDfzxndJ6K_D4Kd_bgHxCx5RtfTRHQruO2ohqSsL_zOk=s90-c'
    recipe_object.rating.should eq 5
    recipe_object.yielding.should eq '6'
    recipe_object.recipe_url.should eq 'http://thepioneerwoman.com/cooking/2009/02/french-onion-soup/'
    recipe_object.ingredient_quantities.should eq [
                                             "1 stick Butter",
                                             "4 whole Large (or 6 Medium) Yellow Onions, Halved Root To Tip, And Sliced Thin",
                                             "1 cup (generous) Dry White Wine",
                                             "4 cups Low Sodium Chicken Broth",
                                             "4 cups Beef Broth",
                                             "2 cloves Minced Garlic",
                                             "Worcestershire Sauce",
                                             "Several Thick Slices Of French Bread Or Baguette",
                                             "5 ounces, weight (to 7 Ounces) Gruyere Cheese, Grated"
                                           ]
  end
end