class OrangeTree
  # TODO: Implement all the specs defined in the README.md :)
  attr_accessor :birth, :height, :age, :fruits

  def initialize
    @height = 0
    @age = 0
    @fruits = 0
  end

  def one_year_passes!
    @age += 1
    fruitsthishere
    dead?
  end

  def dead?
    if @age >= 100
      true
    elsif @age > 50
      [true, false].sample
    else
      false
    end
  end

  def height
    if @age > 10
      @height = 10
    else
      @height = @age
    end
  end

  def fruitsthishere
    if @age > 15
      @fruits = 0
    elsif @age > 10
      @fruits = 200
    elsif @age > 5
      @fruits = 100
    else
      @fruits = 0
    end
  end

  def pick_a_fruit!
    @fruits -= 1
  end
end