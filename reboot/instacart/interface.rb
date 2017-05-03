ITEMS = [
  { name: "Book", price: 5 },
  { name: "TV", price: 300 },
  { name: "Computer", price: 500 },
  { name: "DVD", price: 10 },
]

# Print a welcome message
puts "Welcome to the store!\n\nWhat you want do buy?"

# STAGE 1
# Display a list of items that the user can buy
# - .each_with_index
# - puts out the name of the item with the price and (index+1)
# - display option to finish checking out
# Display a list of items that the usar can buy
ITEMS.each_with_index do |item, index|
  puts "#{index + 1} - #{item[:name]}: #{item[:price]}"
end

# STAGE 2
# Ask the user which item he want to add
# Add the (user input - 1) to the cart array
# - Create an array for the cart
# - Add the index to the cart
cart = []
user_selection = nil

puts "\nPlease select an item:"
user_selection = gets.chomp
cart << user_selection.to_i - 1

# STAGE 3
# Add a loop over the item print and user selection
while user_selection != ""
  puts "Please select another item:"
  user_selection = gets.chomp
  cart << user_selection.to_i - 1 unless user_selection == ""
end

puts "Proceeding to checkout..."

# STAGE 4
# Checkout (Print the bill)
# - iterate over the cart elements
# - convert the cart index into an item
# - print out the name and price of an item
# - add up all the prices
# - print out the total
total = 0

while total == 0
cart.each do |item_index|
  item = ITEMS[item_index]
  total += ITEMS[item_index][:price]
end
  puts "Your total is #{total} dollars"
end




