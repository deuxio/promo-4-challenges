require_relative '../../lib/models/employee.rb'
require_relative '../../lib/repositories/employees_repo.rb'
require_relative '../../lib/views/employee_view.rb'

class EmployeeController

  def initialize(employee_repo)
    @employees = employee_repo
    @employee_view = EmployeeView.new
  end

  def list
    employees = @employees.employees
    @employee_view.print_employee_list(employees)
  end

  def create
    employee_name = @employee_view.get_employee_name.capitalize!
    employee_pass = @employee_view.get_employee_pass
    employee = Employee.new(employee_name, employee_pass)
    @employees.add_employee(employee)
  end

  def check_username
    get_username = @employee_view.get_employee_name.capitalize
    employee = find_user(get_username)
    employee.nil? ? check_username : check_pass(employee)
  end

  def check_pass(employee)
    get_password = @employee_view.get_employee_pass
    get_password == employee.pass ? true : false
  end

  def find_user(username)
    # je pars du postulat qu'il n'existe qu'un employé par nom
    employee = @employees.employees.find { |employee| employee.name == username }
  end
end