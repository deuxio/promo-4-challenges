ROMAN = { I: 1, IV: 4, V: 5, IX: 9, X: 10, XL: 40, L: 50, XC: 90, C: 100, CD: 400, D: 500, CM: 900, M: 1000 }

def roman_to_integer(roman_string)
  roman_string.split(//)

end

# DOMMAGE...

# def roman_to_integer(roman_string, sum = 0)
#   #TODO: translate roman string to integer

#   if ROMAN.include? (roman_string[-2].nil? ? roman_string[-1] : roman_string[-2]+roman_string[-1])
#     # sum = 0 if sum.nil?
#     sum += ROMAN[(roman_string[-2].nil? ? roman_string[-1] : roman_string[-2]+roman_string[-1]).to_sym]
#     p sum
#     2.times { roman_string[-1] = "" }
#     return roman_to_integer(roman_string, sum)
#   elsif ROMAN.include? (roman_string[-1])
#     # sum = 0 if sum.nil?
#     sum += ROMAN[(roman_string[-1]).to_sym]
#     roman_string[-1] = ""
#     return roman_to_integer(roman_string, sum)
#   else
#     sum
#   end
#   p sum
# end

# testing your program
# puts roman_to_integer('IV') == 4 # => true
# puts roman_to_integer('XII') == 12 # => true
# puts roman_to_integer('XIX') == 19 # => true
puts roman_to_integer('IV')
puts roman_to_integer('XII')
puts roman_to_integer('XIX')