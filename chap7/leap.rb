puts "Staring Year: "
start_date = gets.chomp
puts "Ending Year: "
end_date = gets.chomp
puts ""

myrange = (start_date..end_date).to_a
myrange.each do |value|
  if value.to_i % 4 == 0
    if !(value.to_i % 100 == 0) || (value.to_i % 400 == 0)
      puts "#{value} is a leap year!"
    end
   end
end
