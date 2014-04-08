
require 'date'

# Load Birthday into array
birthdays = File.readlines("birthdays")

bday = Hash.new
# Loop thru array and create hash
birthdays.each do |person|
    name,birthdate = person.split(",")
    bday[name] = birthdate.strip
end

def get_next_bday(bday)
    ctime = Time.new
    cyear = ctime.year
    month, day, year = bday.split("/")
    ndate = Time.new(cyear.to_i, month.to_i, day.to_i)
    if ndate < Time.new
        Date.new(cyear+1.to_i, month.to_i, day.to_i)
    else
        Date.new(cyear.to_i, month.to_i, day.to_i)
    end
end

def get_age(mydob)
    month, day, year = mydob.month, mydob.day, mydob.year
    dob = {:year => year, :month => month, :day => day}
    now = Time.now.utc
    now.year - dob[:year] - ((now.month > dob[:month] || (now.month == dob[:month] && now.day >= dob[:day])) ? 0 : 1)
end

# Main Program, Ask for name and give birthdate
continue = true

puts "bday = #{bday}"

while continue == true
    puts "Enter Name {or type quit to exit}: "
    name = gets.strip

    if name == 'quit'
        break
    end

    if bday.keys.grep(/#{name}/i)
        matched = bday.keys.grep(/#{name}/i)[0]
        bday_matched = bday[matched.to_s]
        puts "Passed #{bday_matched}"
        next_bday = get_next_bday(bday_matched)
        next_age = get_age(next_bday)
        puts "#{matched} next birthdate is #{next_bday} and will be #{next_age} old!"
    end
end
