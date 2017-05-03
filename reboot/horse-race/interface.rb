horses = ["Seabiscuit", "Apache", "Blackie", "Warfire", "Deathstar", "Luke Skywalker", "Leia"]

  # Print a welcome message and the horses available to select
p "Welcome to the races! \n Here are the horses you can bet on:"

horses.each_with_index do |horse, index|
  p "#{index + 1} - #{horse}"
end

  # Select a horse to bet on (by number)
print "Bet on:"
user_choice = horses[gets.chomp.to_i - 1]
computer_choice = horses.sample

puts "user: #{user_choice} computer: #{computer_choice}"

  # If the user wins then print "Congatulations" else "Sorry"
p "The winner is... #{computer_choice}"

if user_choice == horses.sample().to_s
    p horses.sample().to_s
    p "Congratulations!"
else
    p horses.sample().to_s
    p "You lost!"
end
