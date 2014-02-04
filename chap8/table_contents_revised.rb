
data = [["Chapter 1: Getting Started", "page  1"],["Chapter 2: Numbers","page  9"], ["Chapter 3: Letters","page 13"]]

width = 60
puts ''
puts("Table of Contents".center(width))

data.each do |mydata|
    chapter = mydata[0]
    page = mydata[1]
    puts(chapter.ljust(width/2) + page.rjust(width/2))
end

