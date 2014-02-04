
def shuffle unshuffled
    shuffled_array = []

    while unshuffled.length > 0
        rindex = rand(unshuffled.length)
        shuffled_array.push(unshuffled[rindex])
        unshuffled.delete_at(rindex)
    end
    return shuffled_array
end

words = ["apple","bee","cat","dog","elephant","fish","gooney"]
puts "Sorted words: #{words}"
puts "Unsorted Words: #{shuffle(words)}"

