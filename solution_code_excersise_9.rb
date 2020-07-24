# Question 1: Given the hash below, change it so that your breakfast has grapefruit instead of bacon
def question1
  my_breakfast = {drink: "Coffee", eggs: "Scrambled", side: "Bacon"}
  ## Write your code below, 1 line
  my_breakfast = my_breakfast.merge(side: "Grapefruit")
  puts my_breakfast
end

# End question 1

# Question 2: Merge the odds and evens hashes into a new hash called merged_hash
# but remove any entries where the values are strings
def question2
  odds = {one: "1", three: "three", five: 5}
  evens = {two: 2, four: 4}
  ## Write your code below, 3 lines
  odds = odds.delete_if { |key, value| value.class == String }
  merged_hash = odds.merge(evens)
  
  puts merged_hash
end
# End question 2


# Question 3: Provide a list of the keys in the hash in reverse order
# Name the variable containing the list as keys_list
def question3
  fruit = { orange: "orange", apple: "green", banana: "yellow" }
  
  ## Write your code below, 1 line
    keys_list = fruit.keys.reverse
  p keys_list
end
# End question 3
