class Recipe
  attr_reader :name, :description, :avg_rating, :nb_votes, :prep_time, :cooking_time, :link

  def initialize(name, description, prep_time, cooking_time, link = "", recipe_rating = 0, recipe_votes = 0)
    @name = name
    @link = link
    @description = description
    @avg_rating = recipe_rating
    @nb_votes = recipe_votes
    @prep_time = prep_time
    @cooking_time = cooking_time
  end
end