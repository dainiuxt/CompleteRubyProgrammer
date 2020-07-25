# The hash created here
credentials = []
continue = true
# The validator method
def validate(field, input)
  while input.length == 0 do
    print "#{field} can not be empty, please enter again: "
    input = gets.chomp
  end
  return input
end
# User input loop 
while continue
  print "Please enter a site name (enter 'exit' to exit): "
  site_input = gets.chomp
  if site_input.downcase == 'exit'
    continue = false
    puts "You selected to exit. Bye!"
  else
    site = validate('Site', site_input)
    # User input validation 
    print "Please enter a username: "
    name_input = gets.chomp
    username = validate('Username', name_input)
    print "Please enter a password: "
    password_input = gets.chomp
    password = validate('Password', password_input)
    # Method to add valid input to hash
    credentials.push({site: site, username: username, password: password})
  end
end
puts "Your list of credentials is: "
print credentials
