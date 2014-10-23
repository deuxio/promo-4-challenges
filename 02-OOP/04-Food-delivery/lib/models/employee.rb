class Employee
  attr_reader :name, :manager, :pass

  def initialize(name, password, manager = false)
    @name = name
    @pass = password
    @manager = manager
    @employee_view =  EmployeeView.new
    @orders = []
  end

  def is_manager?
    @manager == true
  end

  def is_manager!
    @manager = true
  end

  def assigned_order(order)
    @orders << order
  end

  def delivered_order(order)
  @orders = @orders.select { |i| i != order }
  update_employee(self)
  end
end