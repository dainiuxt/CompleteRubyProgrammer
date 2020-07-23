# User try to guess randomly generated number in a range 0-9
require 'active_support/inflector'
match = rand 10
i = 1
puts "Welcome to number guessing game."
print "Please enter a number between 0 and 9: "
user_number = gets.chomp.to_i
while user_number != match
  if user_number > 9 || user_number < 0
    print "Number should be in a range [0..9]: "
    user_number = gets.chomp.to_i
  elsif user_number <= 9 && user_number >= 0 && user_number != match
    print "Please try again: "
    user_number = gets.chomp.to_i
    i += 1
  end
end
puts "Bingo, you guessed it in #{i} " + "attempt".pluralize(i) + "!"
