# Calling one method in another without "foo bar baz" b/s.
# Just to make developer happy and expression understandable 
# for ones who are speaking human language... :)

def congratulations
  return "hello "
end
 
def person(name = "noname")
  return name
end
 
puts congratulations + person("Dainius") # output: "hello Dainius"

puts congratulations + person # output: "hello noname"
