class CustomerView

  def print_customer_list(customers)
    customers.each_with_index do |customer, index|
      puts "#{index} - #{customer.name} (#{customer.adress})"
    end
  end

  def get_customer_name
    puts "What's the customer name?"
    gets.chomp
  end

  def get_customer_adress
    puts "What's the customer adress?"
    gets.chomp
  end

end