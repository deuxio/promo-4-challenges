require_relative "coach_answer"
# TODO: Implement the program that makes you discuss with your coach from the terminal.
  puts "Qu'est ce que tu veux?"
  your_message = gets.chomp

  unless your_message == "I am going to work right now!"
    puts coach_answer_enhanced(your_message)
    else
    ""
  end