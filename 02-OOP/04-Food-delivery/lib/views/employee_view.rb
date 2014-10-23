class EmployeeView

  def get_employee_name
    puts "Type a Valid Username?"
    gets.chomp
  end

  def get_employee_pass
    puts "& Password?"
    gets.chomp
  end

  def print_employee_list(employees)
    employees.each_with_index do |employee, index|
      puts "#{index} - #{employee.name}"
    end
  end

  def print_name_error
    puts "This user doesn't exist."
  end
end
