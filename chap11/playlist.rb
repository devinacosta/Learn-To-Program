
def shuffle unshuffled
    shuffled_array = []

    while unshuffled.length > 0
        rindex = rand(unshuffled.length)
        shuffled_array.push(unshuffled[rindex])
        unshuffled.delete_at(rindex)
    end
    return shuffled_array
end

# Load Songs into Array
songs = File.readlines('songs')

shuffled_songs = shuffle songs
shuffled_songs.each do |song|
    puts song
end
