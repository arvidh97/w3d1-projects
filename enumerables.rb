class Array 

    def my_each(&blk)
        (0...self.length).map do |i| 
            blk[self[i]]
        end
        self
    end

    def my_select(&blk)
        new_arr = []
        self.my_each(&blk).each_with_index do |ele, i| 
            new_arr << self[i] if ele == true
        end
        new_arr
    end
end


