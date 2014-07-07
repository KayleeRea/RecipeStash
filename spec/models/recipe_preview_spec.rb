require 'spec_helper'

describe RecipePreview do
  let(:valid_response) {
    {
    "matches"=> [
    {
      "attributes"=> {
    "course"=> [
    "Main Dishes"
  ]
  },
    "flavors"=> {
    "sweet"=> 0.6666666666666666,
    "sour"=> 1,
    "salty"=> 0.16666666666666666,
    "piquant"=> 0,
    "meaty"=> 0.3333333333333333,
    "bitter"=> 0.6666666666666666
  },
    "rating"=> 5,
    "id"=> "Quick-weeknight-tomato-sauce-with-pasta-308266",
    "imageUrlsBySize"=> {
    "90"=> "http://lh3.ggpht.com/SfiFphCa10eclwH1TY432WTmfQmDdyxV7kbHBoHjxs17XZidnkJbrLXF43QLtUFqbO7TgbLquL61hLl7vFoKpw=s90-c"
  },
    "sourceDisplayName"=> "The Kitchn",
    "totalTimeInSeconds"=> nil,
  "ingredients"=> [
    "chicken sausage",
    "onion",
    "garlic",
    "smoked paprika",
    "star anise",
    "diced tomatoes",
    "pasta"
  ],
    "recipeName"=> "Quick Weeknight Tomato Sauce with Pasta"
  }]
    }
  }
  before do
    stub_request(:get, "http://api.yummly.com/v1/api/recipes").
    with(:query => {
      :_app_id => ENV['YUMMLY_ID'],
      :_app_key => ENV['YUMMLY_KEY'],
      :allowedIngredient => ['garlic', 'chicken', 'tomatoes']
    }).
      to_return(:status => 200, :body => JSON(valid_response))
  end

  subject{RecipePreview.new(['garlic', 'chicken', 'tomatoes'])}
  it 'submits a request to the yummly API' do
    result = subject.results
    result.size.should eq 1
    qwtswp = result.first
    qwtswp.name.should eq 'Quick Weeknight Tomato Sauce with Pasta'
    qwtswp.id.should eq 'Quick-weeknight-tomato-sauce-with-pasta-308266'
    qwtswp.image_url.should eq 'http://lh3.ggpht.com/SfiFphCa10eclwH1TY432WTmfQmDdyxV7kbHBoHjxs17XZidnkJbrLXF43QLtUFqbO7TgbLquL61hLl7vFoKpw=s90-c'
    qwtswp.ingredients.should eq [
                                     "chicken sausage",
                                     "onion",
                                     "garlic",
                                     "smoked paprika",
                                     "star anise",
                                     "diced tomatoes",
                                     "pasta"
                                   ]
  end
end