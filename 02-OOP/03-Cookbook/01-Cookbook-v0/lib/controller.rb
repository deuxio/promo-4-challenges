require_relative "view"

class Controller
  attr_reader :cookbook

  def initialize(cookbook)
    @cookbook = cookbook
    @view = View.new
  end

  def list
    recipes = @cookbook.recipes
    @view.print_recipes(recipes)
  end

  def create
    recipe_name = @view.ask_recipe_name_to_create
    recipe_description = @view.ask_recipe_description_to_create
    recipe = Recipe.new(recipe_name, recipe_description)
    @cookbook.add_recipe(recipe)
  end

  def destroy
    @view.print_recipes(@cookbook.recipes)
    recipe = @view.ask_what_to_detete
    @cookbook.remove_recipe(recipe) if recipe
  end
end