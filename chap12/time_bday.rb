
mytime = Time.new(1977, 05, 15, 02, 05, 00)
puts "Seconds since EPOCH on my b-day is #{mytime.to_i}"

one_billion_seconds_old = mytime.to_i + 1000000000
puts "I will be 1 billion seconds old at: #{Time.at(one_billion_seconds_old)}"


