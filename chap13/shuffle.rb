class Array
  def shuffle
    shuffled_array = []

    while self.length > 0
        rindex = rand(self.length)
        shuffled_array.push(self[rindex])
        self.delete_at(rindex)
    end
    return shuffled_array
   end
end

words = ["apple","bee","cat","dog","elephant","fish","gooney"]
puts "Sorted words: #{words}"
puts "Unsorted Words: #{words.shuffle}"


