require 'Date'

class Order
  attr_reader :composition, :customer, :total, :employee, :date, :delivered

  def initialize(composition, customer, total = 0, date = Time.now, employee = nil, delivered = false)
    @composition = composition  # Array of meals
    @customer = customer
    @total = total
    @date = date
    @employee = employee
    @delivered = delivered

    compute_price(composition)
  end

  def delivered!
    @delivered = true
  end

  def compute_price(composition)
    composition.each do |meal|
      @total += meal.price
    end
  end
end