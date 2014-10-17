require "csv"
require_relative "recipe"

class Cookbook
  attr_reader :recipes

  def initialize(csv_file)
    @recipes = []   # Contient des Instances de Recipe
    @csv_file = csv_file

    CSV.foreach(@csv_file) do |row|  # remplis notre db temporaire depuis le csv
      @recipes << Recipe.new(row[0], row[1])
    end
  end

  def add_recipe(recipe)
    CSV.open(@csv_file, "a") do |csv|
      csv << [recipe.name, recipe.description]
    end
    @recipes << recipe
  end

  def remove_recipe(recipe_id)
    @recipes.delete_at(recipe_id)

    CSV.open(@csv_file, "wb") do |csv|
      @recipes.each do |recipe|
        csv << [recipe.name, recipe.description]
      end
    end
  end
end