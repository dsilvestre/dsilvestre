# STAGE 1
# Create a looping menu (until loop)
# - Display the menu options (list / add / delete / mark / done)
# - Ask the user to select menu option
# - gets.chompection
# - print "You selected #{user_selection}"
# - Add an option to leave loop

# STAGE 2 (List, Add and Delete)
# Start with a list array
# List
# - loop through: list.each_with_index
# - display the index: puts "#{index + 1}"
# - display the item name
# Add
# - Ask: "Enter item name to add to list"
# - Get the item name from the user: gets.chomp
# - add to the list array: list <<
# Delete
# - Ask: "What item do you want to delete?"
# - Get the item name from the user: gets.chomp
# - remove item: (list.delete_at or list.delete)

# CURVE BALL STAGE
# - Convert your list to a hash
# Make the list option display with
# - [X] guitar (for marked items)
# - [ ] doll (for non-marked items)
# - Make sure list, add and delete still work
# -- Change the list method to not use index
# -- Change the add to add items the hash way
# -- Change the delete to delete the hash way
# -- Change the delete by string not by index

# STAGE 3
# Make the mark option work
# Update the item value list[user_option.downcase] = true
# Modify list to display mark status
# - [X] guitar (for marked items)
# - [ ] doll (for non-marked items)

# STAGE 4
# Add the "idea" option in the menu
# "gem instal nokogiri"
# Ask user for etsy search term
# Search etsy store
# Store etsy results in an array
# Display to user with an index
# Ask user for index of item to add
# Add item from etsy array into list hash
require "open-uri"
require "nokogiri"

list = {
  "bicycle" => false,
  "guitar" => false,
  "doll" => false,
  "dog" => false,
  "surfboard" => false,
}

input = ""

def print_list(list)
  list.each do |key, value|
    puts "#{key.capitalize}"
  end
end

def print_mark(list)
  list.each do |key, value|
    if value
      puts "[X] #{key.capitalize}"
    else
      puts "[ ] #{key.capitalize}"
    end
  end
end

until input == "Exit"
  puts "What do you want to do [List|Add|Delete|Mark|Idea|Exit]?"
  input = gets.chomp.downcase

case input
  when "list"
    puts "Here are all the items:"
    print_list(list)
  when "add"
    print_list(list)
    puts "Enter item name to add to list:"
    user_item = gets.chomp.capitalize
    list[user_item] = false
  when "delete"
    print_list(list)
    puts "What item do you want to delete?"
    user_delete = gets.chomp.capitalize
    list.delete(user_delete)
  when "mark"
    print_list(list)
    puts "What item do you want to mark?"
    user_mark = gets.chomp.capitalize
    list[user_mark] = true
    print_mark(list)
  when "idea"
    puts "What are you searching on Etsy?"

    article = gets.chomp
    file = open("https://www.etsy.com/search?q=#{article}")
    doc = Nokogiri::HTML(file)
    etsy_results = []

    doc.search(".card").each do |card|
    etsy_results << card.search(".card-title").text.strip
    end

    etsy_results = etsy_results[0..9]

    etsy_results.each_with_index do |result, index|
      puts "#{index + 1} - #{result}"
    end

    selected_result = gets.chomp.to_i - 1
    result_string = etsy_results[selected_result].split.first(3).join(" ")
    puts "You selected #{result_string}"
    list[result_string] = false

  when "exit"
    puts "You selected Exit\n\nProceeding to checkout..."
    break
  else
  puts "Please select a valid action! [List|Add|Delete|Mark|Exit]"
end
end
