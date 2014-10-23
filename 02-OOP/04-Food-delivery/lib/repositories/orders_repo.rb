require "csv"

class OrdersRepo
  attr_reader :orders

  def initialize(orders)
    @orders = []
    @csv_file = csv_file

    CSV.foreach(@csv_file) do |row|  # remplis notre db temporaire depuis le csv
      @orders << Order.new(row[0], row[1], row[2], row[3], row[4], row[5])
    end
  end

  def add_order(order)
    CSV.open(@csv_file, "a") do |csv|
      csv << [order.composition, order.customer, order.total, order.date, order.employee, order.delivered]
    end
    @orders << order
  end

  def remove_order(order_id)
    @orders.delete_at(order_id.to_i)

    CSV.open(@csv_file, "wb") do |csv|
      @orders.each do |recipe|
      csv << [order.composition, order.customer, order.total, order.date, order.employee, order.delivered]
      end
    end
  end
end