def ding description, &block
  current_hour = Time.new.hour
  hours = (0..current_hour)

  hours.each do |hour|
    block.call
  end
end

ding "test" do
  puts "Ding!"
end
