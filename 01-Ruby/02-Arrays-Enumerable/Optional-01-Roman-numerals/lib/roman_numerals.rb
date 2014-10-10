def old_roman_numeral(an_integer, roman = nil)
  # TODO: translate integer in roman number
  if an_integer >= 1000
    an_integer -= 1000
    roman.nil? ? roman = "M" : roman += "M"
    return old_roman_numeral(an_integer, roman)
  elsif an_integer >= 500
    an_integer -= 500
    roman.nil? ? roman = "D" : roman += "D"
    return old_roman_numeral(an_integer, roman)
  elsif an_integer >= 100
    an_integer -= 100
    roman.nil? ? roman = "C" : roman += "C"
    return old_roman_numeral(an_integer, roman)
  elsif an_integer >= 50
    an_integer -= 50
    roman.nil? ? roman = "L" : roman += "L"
    return old_roman_numeral(an_integer, roman)
  elsif an_integer >= 10
    an_integer -= 10
    roman.nil? ? roman = "X" : roman += "X"
    return old_roman_numeral(an_integer, roman)
  elsif an_integer >= 5
    an_integer -= 5
    roman.nil? ? roman = "V" : roman += "V"
    return old_roman_numeral(an_integer, roman)
  else
    an_integer -= 1
    roman.nil? ? roman = "I" : roman += "I"
    return old_roman_numeral(an_integer, roman)
  end

  puts roman

end

old_roman_numeral(2341)

#def new_roman_numeral(an_integer)
  # TODO: translate integer in roman an_integer
#end