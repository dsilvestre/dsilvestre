first_number = nil

while first_number.class != Fixnum

  # Get first number from user
p "Enter a first number:"
first_number = gets.chomp

  if first_number == ""
    abort("Goodbye!")
  end
  first_number = first_number.to_i

  # Get second number from user
p "Enter a second one:"
second_number = gets.chomp

  if second_number == ""
      abort("Goodbye!")
    end
  second_number = second_number.to_i

  # Get operation from user
p "Which operation [+][-][x][/]:"
operator = gets.chomp

# Run calculator
def calculate(first_number, second_number, operator)
  if operator == "+"
    return result = first_number + second_number
  elsif operator == "-"
    return result = first_number - second_number
  elsif operator == "x"
    return result = first_number * second_number
  elsif operator == "/"
    return result = first_number / second_number
  else
    ""
  end
  return result = calculate(first_number, second_number, operator)

end

p calculate(first_number, second_number, operator)

end
