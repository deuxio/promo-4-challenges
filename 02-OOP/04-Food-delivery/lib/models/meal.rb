class Meal
  attr_reader :name, :price

  def initialize(name, price)
    @name = name
    @price = price.to_i
  end
end