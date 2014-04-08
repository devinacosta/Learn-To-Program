
class OrangeTree

    def initialize
        @tree_height = 0
        @orange_count = 0
    end

    def height 
        @tree_height
    end

    def one_year_passes
        @tree_height += 1
        
        if @tree_height > 3
            @orange_count += 20
        end

    end

    def count_the_oranges
        @orange_count
    end

    def pick_an_orange
        @orange_count -= 1
        "Mmmmmm that orange was delicious"
    end

end

t = OrangeTree.new
puts t.height
t.one_year_passes
puts t.height
t.one_year_passes
t.one_year_passes
t.one_year_passes
puts t.count_the_oranges
puts t.pick_an_orange
