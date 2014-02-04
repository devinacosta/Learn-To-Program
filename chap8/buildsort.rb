
puts "Enter as many words (one word per line), press Enter on blank line to be done."

words = []

while true
    current_word = gets.chomp
    if current_word.empty?
        break
    end
    words.push(current_word)
end

words.sort.each do |word|
    puts word
end
