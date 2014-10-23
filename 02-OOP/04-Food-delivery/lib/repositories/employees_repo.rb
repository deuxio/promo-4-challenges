require "csv"

class EmployeeRepo
  attr_reader :employees

  def initialize(csv_file)
    @csv_file = csv_file
    @employees = []

    CSV.foreach(@csv_file) do |row|
      @employees << Employee.new(row[0], row[1], row[2])
    end
  end

  def add_employee(employee)
    CSV.open(@csv_file, "a") do |csv|
      csv << [employee.name, employee.password, employee.manager]
    end
    @employees << employee
  end

  def update_employee(employee)
    CSV.open(@csv_file, "wb") do |csv|
      @employees.each do |employee|
      csv << [employee.name, employee.password, employee.manager]
      end
    end
  end
end