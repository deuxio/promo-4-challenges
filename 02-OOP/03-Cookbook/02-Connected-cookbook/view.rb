class View
  def ask_what_to_do
    puts "What would you like to do?"
    print "> "
    gets.chomp
  end

  def ask_recipe_name_to_create
    puts "What's the name of your recipe?"
    print "> "
    gets.chomp
  end

  def ask_ingredient_to_import
    puts "Import recipes for which ingredient ?"
    print "> "
    gets.chomp
  end

  def ask_recipe_description_to_create
    puts "What's its description?"
    print "> "
    gets.chomp
  end

  def ask_recipe_prep_time_to_create
    puts "What's its Preparation Time?"
    print "> "
    gets.chomp
  end

  def ask_recipe_cook_time_to_create
    puts "What's Cooking Time?"
    print "> "
    gets.chomp
  end

  def ask_what_to_detete
    puts "Which recipe would you like to delete?"
    print "> "
    begin
      Integer(gets.chomp)
    rescue ArgumentError
      puts "Ce n'est pas un id correct"
      nil
    end
  end

  def print_recipes(recipes)
    puts "Here's the list of your recipes:"
    recipes.each_with_index do |recipe, index|
      puts "#{index} - #{recipe.name}"
    end
  end
end