require_relative '../../lib/models/customer.rb'
require_relative '../../lib/repositories/customers_repo.rb'
require_relative '../../lib/views/customer_view.rb'

class CustomerController

  def initialize(customer_repo)
    @customers = customer_repo
    @customer_view = CustomerView.new
  end

  def list
    customers = @customers.customers
    @customer_view.print_customer_list(customers)
  end

  def create
    customer_name = @customer_view.get_customer_name
    customer_adress = @customer_view.get_customer_adress
    customer = Customer.new(customer_name, customer_adress)
    @customers.add_customer(customer)
  end
end