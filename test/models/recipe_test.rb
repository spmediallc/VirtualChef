require 'test_helper'

class RecipeTest < ActiveSupport::TestCase

def setup
  @recipe = Recipe.new(name: "coq au vin", summary: "Classic French Fare", description: "braise chicken in red wine and assorted vegetables")
end

test "recipe is required" do
  assert @recipe.valid?
end

test "name is required" do
  @recipe.name = " "
  assert_not @recipe.valid?
end

test "name must be >= 5" do
    @recipe.name = "aaaa"
    assert_not @recipe.valid?
  end
  
  test "name must be <= 50 characters"
   @recipe.name ="a"*51 
    assert_not @recipe.valid?
end
    
end

test "summary is required" do
  @recipe.summary = " "
  assert_not @recipe.valid?
end

test "summary must be >= 10 and <= 250 characters" do
end

test "description is required" do
  @recipe.description = " "
  assert_not @recipe.valid?
end  

test "description must be >= 50 and <= 250 characters" do
end

test "chef_id is required" do
end
  
end