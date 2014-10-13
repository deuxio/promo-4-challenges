def group_mails(emails)
  # TODO: group email by provider
  e_hash = {}
  emails.each do |email|
    next if email.match(/\n/)
    email.scan(/((\w+.+)@(\w+).\w+)/)
    e_hash[$3] = [] unless e_hash[$3]
    e_hash[$3] << $1
  end
  e_hash
end

def provider?(email, provider)
  # TODO: return true if email is of given provider
  email =~ /#{provider}/ ? true : false
end