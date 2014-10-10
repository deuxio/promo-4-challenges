ORDER = {
  "Cheese Burger" => 290,
  "Big Mac" => 300,
  "Mc Bacon" => 400,
  "Royal Cheese" => 130,
  "French fries" => 130,
  "Potatoes" => 130,
  "Coca" => 160,
  "Sprite" => 170
}

MEALS = {
  "Happy Meal" => ["Cheese Burger", "French fries", "Coca"],
  "Best Of Big Mac" => ["Big Mac", "French fries", "Coca"],
  "Best Of Royal Cheese" => ["Royal Cheese", "Potatoes", "Sprite"]
}

def poor_calories_counter(burger, side, beverage)
  #TODO: return number of calories for this mcDonald order
  calorie = 0

  ORDER.each do |key, value|
    burger == key ? calorie += value : calorie
    side == key ? calorie += value : calorie
    beverage == key ? calorie += value : calorie
  end

  calorie
end

poor_calories_counter("Cheese Burger", "French fries", "Coca")

def calories_counter(*orders)
  #TODO: return number of calories for a less constrained order
  calorie = 0

  orders.each do |order|
    if MEALS.include?(order)
      MEALS[order].each { |meal_detail| calorie += ORDER[meal_detail] }
    elsif ORDER.include?(order)
      calorie += ORDER[order]
    else
      calorie
    end
  end
  calorie
  p calorie
end

# calories_counter("Happy Meal")
# calories_counter("Cheese Burger")
calories_counter("Happy Meal", "Cheese Burger")
# calories_counter("Happy Meal", "Cheese Burger", "Big Mac")