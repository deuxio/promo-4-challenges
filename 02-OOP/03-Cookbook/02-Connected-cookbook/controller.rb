require 'nokogiri'
require 'open-uri'
require_relative 'view'
require_relative 'import'

class Controller
  attr_reader :cookbook

  def initialize(cookbook)
    @cookbook = cookbook
    @view = View.new
    @import = Import.new(cookbook)
  end

  def list
    recipes = @cookbook.recipes
    @view.print_recipes(recipes)
  end

  def create
    recipe_name = @view.ask_recipe_name_to_create
    recipe_description = @view.ask_recipe_description_to_create
    recipe_prep_time = @view.ask_recipe_prep_time_to_create
    recipe_cook_time = @view.ask_recipe_cook_time_to_create
    recipe = Recipe.new(recipe_name, recipe_description, recipe_prep_time, recipe_cook_time)
    @cookbook.add_recipe(recipe)
  end

  def destroy
    @view.print_recipes(@cookbook.recipes)
    recipe = @view.ask_what_to_detete
    @cookbook.remove_recipe(recipe) if recipe
  end

  def import
    ingredient = @view.ask_ingredient_to_import
    puts "Importing recipe data from marmiton for '#{ingredient}'..."
    @import.from_marmiton(ingredient)
  end
end