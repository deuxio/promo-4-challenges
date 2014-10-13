def french_phone_number?(phone_number)
  # TODO: true or false?
  phone_number = phone_number.gsub(/\s|-/, "")
  phone_number =~ /(\+33|0)[1-9]\d{8}/ ? true : false
end