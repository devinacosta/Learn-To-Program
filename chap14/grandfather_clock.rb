
def clock description, &block
    current_hour = Time.new.hour
    puts current_hour
end

clock "blah" do
    puts "hello"
end
