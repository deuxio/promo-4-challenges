# TODO: require relevant files to bootstrap the app.
require_relative 'models/customer.rb'
require_relative 'models/order.rb'
require_relative 'views/order_view.rb'
require_relative 'controllers/order_controller.rb'
require_relative 'repositories/orders_repo.rb'
require_relative 'models/employee.rb'
require_relative 'views/employee_view.rb'
require_relative 'controllers/employee_controller.rb'
require_relative 'repositories/employees_repo.rb'
require_relative 'models/restaurant.rb'
require_relative 'controllers/restaurant.rb'
require_relative 'views/restaurant_view.rb'
require_relative 'repositories/meals_repo.rb'

# Then you can test your program with:
#    $ ruby app.rb