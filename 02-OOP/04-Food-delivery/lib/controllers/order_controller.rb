require_relative '../models/order'
require_relative '../models/meal'
require_relative '../views/order_view'
require_relative '../repositories/orders_repo'
require_relative '../repositories/meals_repo'

class OrderController
  def initialize(order_repo, meals_repo)
    @orders = order_repo
    @order_view = OrderView.new
    @meals = meals_repo
  end

  def list_orders
    orders = @orders.orders
    @order_view.print_order_list(orders)
  end

  def create_order(customer)
    order_composition = @order_view.get_order_composition(@meals)
    order = Order.new(order_composition, customer)
    @orders.add_order(order)
  end

  def delete_order
    list_orders
    order = @order_view.ask_what_to_detete
    @orders.remove_order(order) if order
  end

  def change_status
    list_orders
    order_id = @order_view.get_delivered_order.to_i
    @orders.orders[order_id].delivered! if order_id
    # retirer l'order de l'array ORDER du delivery guy
    @orders.orders[order_id].employee.delivered_order(@orders.orders[order_id])
    #sauvegarde dans repo
    @orders.remove_order(order)
  end

  def order_details
    list_orders
    get_order = @order_view.get_order_details.to_i
    order = @orders.orders[get_order]
    @order_view.print_order_details(order)
  end
end