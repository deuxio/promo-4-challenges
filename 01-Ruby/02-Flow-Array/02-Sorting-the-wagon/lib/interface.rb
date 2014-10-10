require_relative "wagon_sort"

# EN VERSION RECURSIF
# student_list = []

# def question(answer)
#   student_temp =[]
#   if answer != ""
#     student_temp << answer
#     puts "Type another student name (or press enter to finish):"
#     answer = gets.chomp
#     student_temp + question(answer)
#   else
#     student_temp
#   end
# end

# puts "Type a student name:"
# answer = gets.chomp
# student_list = question(answer)

# EN VERSION PLUS SIMPLE
student_list = []
name = nil

while name != ""
  if student_list.empty?
    puts "Type a student name:"
  else
    puts "Type another student name (or press enter to finish):"
  end

  name = gets.chomp

  if name != ""
    student_list << name
  end
end

puts "Congratulations! Your Wagon has #{student_list.size} students:"

first = wagon_sort(student_list).take(student_list.size - 1).join(", ")
last = wagon_sort(student_list)[-1]

puts "- #{first} and #{last}"

# TODO: Then call `wagon_sort` method defined in the wagon_sort.rb
#       file and display the sorted student list