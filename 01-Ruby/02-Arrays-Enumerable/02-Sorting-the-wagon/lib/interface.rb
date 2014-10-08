require_relative "wagon_sort"

# TODO: Ask the user about students to add to the Wagon.
#       Remember, to read an input from the command line, use:
#       - `gets`:  http://www.ruby-doc.org/core-2.1.2/Kernel.html#method-i-gets
#       - `chomp`: http://www.ruby-doc.org/core-2.1.2/String.html#method-i-chomp
student_list = []

def question(answer)
  student_temp =[]
  if answer != ""
    student_temp << answer
    puts "Type another student name (or press enter to finish):"
    answer = gets.chomp
    student_temp + question(answer)
  else
    student_temp
  end
end

puts "Type a student name:"
answer = gets.chomp
student_list = question(answer)

puts "Congratulations! Your Wagon has #{student_list.size} students:"

first = wagon_sort(student_list).take(student_list.size - 1).join(", ")
puts first
last = wagon_sort(student_list)[-1]
puts last

puts "- #{first} and #{last}"

# TODO: Then call `wagon_sort` method defined in the wagon_sort.rb
#       file and display the sorted student list