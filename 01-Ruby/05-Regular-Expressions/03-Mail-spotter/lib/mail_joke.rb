# Encoding: utf-8

def mail_joke(email)
  # TODO: Return (not print!) a joke suited to the email provided
  fail ArgumentError, 'should pass a valid email adress' unless email =~ (/(\w+.+)@(\w+).\w{2,3}/)
  match = email.scan(/(\w+.+)@(\w+.\w{2,3})/).flatten
  username = match[0].gsub(/\./, " ")
  domain = match[1]

  case domain
  when "lewagon.org"
    "Well done #{username}, you're skilled and capable"
  when "gmail.com"
    "#{username}, you're an average but modern person"
  when "live.com"
    "#{username}, aren't you born before 1973?"
  else
    "Sorry #{username}, we don't know how to judge '#{domain}'"
  end
end