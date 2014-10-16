class Restaurant
  # TODO: add relevant accessors if necessary
  attr_reader :name, :city
  attr_accessor :average_rating

  def initialize(city, name)
    # TODO: implement constructor with relevant instance variables
    @name = name
    @city = city
    @ratings = []
    @average_rating = 0
  end

  # TODO: implement #filter_by_city and #rate methods

  def rate(rating)
    @ratings << rating
    sum_rating = 0
    @ratings.each { |rate| sum_rating += rate }
    @average_rating = sum_rating / @ratings.size
  end

  def self.filter_by_city(restaurants, city)
    filtered_restaurants = []
    restaurants.each do |resto|
      filtered_restaurants << resto if resto.city.downcase == city.downcase
    end
    filtered_restaurants
  end
end