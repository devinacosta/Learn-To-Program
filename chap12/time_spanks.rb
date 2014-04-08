
#def age(bday)
#      now = Time.now.utc.to_date
#      now.year - bday.year - (bday.to_date.change(:year => now.year) > now ? 1 : 0)
#end
#
def age dob
    now = Time.now.utc
    now.year - dob[:year] - ((now.month > dob[:month] || (now.month == dob[:month] && now.day >= dob[:day])) ? 0 : 1)
end

dob = { :month => 05, :year => 1977, :day => 15}


puts "What Year were you born?: "
year = gets.strip.to_i

puts "What Month were you born?"
month = gets.strip.to_i

puts "What Day were you born?"
day = gets.strip.to_i

dob = {:month => month, :day => day, :year => year} 

puts
puts "You are currently #{age(dob)} old! You will be getting #{age(dob)} spankings..."

i = 1
myage = age(dob)
while i <= myage
    puts "Spanking for b-day #{i}"
    i += 1
end

