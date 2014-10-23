class OrderView

  def print_order_list(orders)
    puts "---==== ORDER LIST ====---"
    orders.each_with_index do |order, index|
      meals = order.composition.map { |meal| meal.name }
      puts "#{index} - #{meals.join(", ")} // #{order.delivered ? "delivered" : "not delivered"} to #{order.customer}"
    end
  end

  def get_order_composition(meals) # TODO : passer le parametre (meals)
    puts ""
    puts "> Choose your meals (seperated by ',' commas):"
    print_meals(meals)
    order = gets.chomp.split(",").map! {|i| i.to_i}
    order = order.map { |i| meals[i]}
    p order
  end

  def print_meals(meals)
    meals = meals.map { |meal| meal.name }
    meals.each_with_index do |meal, index|
      puts "#{index} - #{meal}"
    end
  end

  def ask_what_to_detete
    puts ""
    puts "> Which order would you like to delete?"
    gets.chomp
  end

  def get_delivered_order
    puts "> Select order that has been delivered?"
    gets.chomp
  end

  def get_order_details
    puts ""
    puts "> Select order to get details."
    gets.chomp
  end

  def print_order_details(order)
    puts "---==== ORDER DETAILS ====---"
    meals = order.composition.map { |meal| meal.name }
    puts "Composition: #{meals.join(", ")}"
    puts "Customer: #{order.customer}"
    puts "Total: #{order.total}"
    puts "Employee: #{order.employee}"
    puts "Date: #{order.date}"
    puts "#{order.delivered ? "Delivered" : "NOT Delivered"} "
  end
end