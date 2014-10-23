class Customer
  attr_reader :name, :adress

  def initialize(name, adress)
    @name = name
    @adress = adress
  end
end