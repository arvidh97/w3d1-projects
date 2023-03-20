# require "byebug"
class Array 

    def my_each(&blk)
        (0...self.length).map do |i| 
            blk[self[i]]
        end
        self
        # self.map {|el| blk[el]}
    end

    def my_select(&blk)
        # debugger
        new_arr = []
        self.my_each(&blk).each_with_index do |ele, i| 
            new_arr << self[i] if blk[ele] == true
        end
        new_arr
    end
    
    def my_reject(&blk)
        arr = []
        self.each_with_index do |ele,i|
            arr << self[i] if blk[ele]==false
        end
        arr
    end

    def my_any?(&blk)
        count = 0
        self.each {|el| count+=1 if blk[el] == true}
        count >= 1
    end
    
    def my_all?(&blk)
        count = 0
        self.each {|el| count+=1 if blk[el] == true}
        count == self.length
    end
end

