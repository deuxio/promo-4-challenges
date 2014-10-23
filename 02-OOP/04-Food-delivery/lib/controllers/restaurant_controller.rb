class RestaurantController
  def initialize
    @restaurant = Restaurant.new
    @restaurant_view = RestaurantView.new
  end

  def print_welcome
    @restaurant_view.print_welcome_to(@restaurant)
  end
end