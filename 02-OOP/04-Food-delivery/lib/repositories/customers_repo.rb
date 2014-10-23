require "csv"

class CustomersRepo
  attr_reader :customers

  def initialize(csv_file)
    @csv_file = csv_file
    @customers = []

    CSV.foreach(@csv_file) do |row|  # remplis notre db temporaire depuis le csv
      @customers << Customer.new(row[0], row[1])
    end
  end

  def add_customer(customer)
    CSV.open(@csv_file, "a") do |csv|
      csv << [customer.name, customer.adress]
    end
    @customers << customer
  end
end