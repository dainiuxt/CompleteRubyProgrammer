# User try to guess randomly generated number in a range 0-3
print "Please enter a number between 0 and 3: "
user_number = gets.chomp.to_i
match = rand 4
if user_number == match 
  puts "Bingo, you guessed it!"
else puts "Please try again, sorry..."
end
