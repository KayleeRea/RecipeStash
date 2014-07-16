require 'spec_helper'

feature 'User can do a search and will recieve a list of preview recipes' do
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
    visit '/'
    click_on 'Register'
    fill_in 'Email', with: 'kaylee@example.com'
    fill_in 'Password', with: 'password'
    click_on 'Sign Up'
    expect(page).to have_content 'Registered! Please login now'


    fill_in 'Email', with: 'kaylee@example.com'
    fill_in 'Password', with: 'password'
    click_on 'Submit'

    stub_request(:get, "http://api.yummly.com/v1/api/recipes").
      with(:query => {
      :_app_id => ENV['YUMMLY_ID'],
      :_app_key => ENV['YUMMLY_KEY'],
      :allowedIngredient => ['garlic', 'chicken', 'tomatoes']
    }).
      to_return(:status => 200, :body => JSON(valid_response))
  end

  scenario 'a user can fill in fields to make a search on the Yummly API' do
    click_on 'Search For Recipes Now'
    expect(page).to have_content 'Fill In Your Ingredients Below'

    fill_in 'First Ingredient', with: 'garlic'
    fill_in 'Second Ingredient', with: 'chicken'
    fill_in 'Third Ingredient', with: 'tomatoes'
    click_on 'Submit'
    expect(page).to have_content 'Based on Your Ingredients'
    expect(page).to have_content 'See Full Recipe'

  end
end
