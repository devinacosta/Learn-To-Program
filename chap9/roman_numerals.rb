
# Old School Roman Numerals

def old_roman num
    num = num.to_i
    roman = ''
    roman = roman + 'M' * (num / 1000)
    roman = roman + 'D' * (num % 1000 / 500)
    roman = roman + 'C' * (num % 500 / 100)
    roman = roman + 'L' * (num % 100 / 50)
    roman = roman + 'X' * (num % 50 / 10)
    roman = roman + 'V' * (num % 10 / 5)
    roman = roman + 'I' * (num % 5/ 1)
    roman
end

def new_roman number
  number = number.to_i
  thousands_place = number      / 1000
  hundreds_place  = number%1000 /  100
  tens_place      = number%100  /   10
  ones_place      = number%10   /    1

  numeral = "M"*thousands_place

  if hundreds_place == 9
    numeral = numeral + "CM"
  elsif hundreds_place == 4
    numeral = numeral + "CD"
  else
    numeral = numeral + "D"*(number%1000/500)
    numeral = numeral + "C"*(number%500 /100)
  end

  if tens_place == 9
    numeral = numeral + "XC"
  elsif tens_place == 4
    numeral = numeral + "XL"
  else
    numeral = numeral + "L"*(number%100/50)
    numeral = numeral + "X"*(number%50 /10)
  end

  if ones_place == 9
    numeral = numeral + "IX"
  elsif ones_place == 4
    numeral = numeral + "IV"
  else
    numeral = numeral + "V"*(number%10/5)
    numeral = numeral + "I"*(number%5 /1)
  end
  return numeral

end

print("Enter Number: ")
number = gets.chomp

puts("Old Roman Numeral: "+ (old_roman number))
puts("New Roman Numeral: "+ (new_roman number))

