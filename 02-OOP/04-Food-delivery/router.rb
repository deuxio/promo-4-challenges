class Router

def initialize(customer_csv, employee_csv, meals_csv, orders_csv)
  # Initialisation
  customers_repo = CustomersRepo.new(customer_csv)
  employees_repo = EmployeesRepo.new(employee_csv)
  meals_repo = MealsRepo.new(meals_csv)
  orders_repo = OrdersRepo.new(orders_csv)
end
# Routes

employees_repo

puts "Welcome to CORBA SALONU"
puts "-------------------------------"

# > Please enter your username:
# > john_doe
# > Please enter your password:
# > ********
# > -------------------------------
# > Welcome, john_doe.  Your access level is : MANAGER
# > -------------------------------
# > What would you like to do?
# > Options:
# > 1. List customers
# > 2. Add customer
# > 3. View orders <customer_id>
# > 4. Add order <customer_id>, <employee_id_>
# > 5. Remove order <order_id>
# > 6. List employees
# > 7. Log out

end