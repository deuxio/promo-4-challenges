require_relative 'controller'
require_relative 'marmiton'

class Router
  def initialize(controller)
    @controller = controller
    @running = true
  end

  def run
    puts "Welcome to the Cookbook!"
    puts "           --           "
    while @running
      display_tasks
      action = gets.chomp.to_i
      print `clear`
      route_action(action)
    end
  end

  def stop
    @running = false
  end

  private

  def route_action(action)
    case action
    when 1 then @controller.import
    when 2 then @controller.list
    when 3 then @controller.create
    when 4 then @controller.destroy
    when 5 then stop
    else puts "Please press 1, 2, 3, 4 or 5"
    end
  end

  def display_tasks
    puts ""
    puts "What do you want to do next?"
    puts "1 - Import recipes from marmiton"
    puts "2 - List all recipes"
    puts "3 - Add a recipe"
    puts "4 - Delete a recipe"
    puts "5 - Exit"
  end
end