
count = 99

while true
    puts "#{count} bottles of beer on the wall, #{count} bottles of beer."
    count -= 1
    puts "Take one down, pass it around, #{count} bottles of beer on the wall..."
    if count == 0
        break
    end
end
