require "csv"

class MealsRepo
  attr_reader :meals, :price

  def initialize(meals)
    @meals = []
    @csv_file = csv_file

    CSV.foreach(@csv_file) do |row|  # remplis notre db temporaire depuis le csv
      @meals << Meal.new(row[0], row[1])
    end
  end

  def add_meal(meal)
    CSV.open(@csv_file, "a") do |csv|
      csv << [meal.name, meal.price]
    end
    @meals << meal
  end
end