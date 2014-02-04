
def dictionary_sort words
    sorted = words.sort_by { |x| x.downcase }
    return sorted 
end
    

words = ["Bacon","apple","Ham","bread"]
puts dictionary_sort(words)

