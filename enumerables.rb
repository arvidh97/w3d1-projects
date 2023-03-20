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

    def my_flatten
     
        new_arr = []
        self.each do |ele| 
            if !ele.is_a?(Array) 
                new_arr << ele
            else
            new_arr += ele.my_flatten
            end
        end
        new_arr
    end
  
    def my_zip(*args)
        new_arr = Array.new(self.length) {Array.new}
        (0...self.length).each do |i| 
            new_arr[i] << self[i] 
            args.each do |arg| 
                if arg[i] != nil 
                    new_arr[i] << arg[i]
                else
                    new_arr[i] << nil
                end
            end
        end
        new_arr
    end
end

a = [ 4, 5, 6 ]
b = [ 7, 8, 9 ]
p [1, 2, 3].my_zip(a, b) # => [[1, 4, 7], [2, 5, 8], [3, 6, 9]]
p a.my_zip([1,2], [8])   # => [[4, 1, 8], [5, 2, nil], [6, nil, nil]]
p [1, 2].my_zip(a, b)    # => [[1, 4, 7], [2, 5, 8]]

c = [10, 11, 12]
d = [13, 14, 15]
p [1, 2].my_zip(a, b, c, d) 

