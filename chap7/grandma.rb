
a = true

while a == true 
  puts "Say something to Grandma:"
  talk = gets.chomp.to_s

  random_year = rand(1930..1950)
  if talk == talk.downcase && talk != 'BYE'
    puts "HUH?! SPEAK UP, SONNY!"
  elsif talk == talk.upcase && talk != 'BYE'
    puts "NO, NOT SINCE #{random_year}"
  end
  if talk == 'BYE'
      a = false
  end
end
