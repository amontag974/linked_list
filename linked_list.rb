class Node
    attr_accessor :next_node
    attr_reader :value

    def initialize value
        @value = value
        @next_node = nil
    end
end

class LinkedList
    attr_accessor :start, :end

    def initialize
        @start = nil
    end

    def append data
        if !@start
            @start = Node.new(data)
        else
            p = @start
            while p.next_node != nil
                p = p.next_node
            end
            p.next_node = Node.new(data)
        end
    end

    def prepend data
        if !@start
            @start = Node.new(data)
        else
            temp = Node.new(data)
            temp.next_node = @start
            @start = temp
        end
    end

    def size
        return 0 if !@start
        count = 1
        p = @start
        while p.next_node
            p = p.next_node
            count += 1
        end
        count
    end

    def head
        @start ? @start : "No nodes have been initialized."
    end

    def tail
        self.not_initialized?

        p = @start
        while p.next_node
            p = p.next_node
        end
        puts p.value
    end

    def at index
        self.not_initialized?

        p = @start
        count = 0
        while count < index
            p = p.next_node
            count += 1
        end
        return p.value
    end

    def pop
        self.not_initialized?

        p = @start
        until !p.next_node.next_node
            p = p.next_node
        end
        p.next_node = nil
        return
    end

    def not_initialized?
        if !@start
            puts "No nodes have been initialized." 
            return
        end
    end
    
    def contains? entry
        return false if !@start
        p = @start
        return true if p.value == entry
        while p.value != entry && p.next_node
            p = p.next_node
            return true if p.value == entry
        end
        false
    end

    def find data
        return false if !@start
        p = @start
        count = 0
        return 0 if p.value == data
        while p.value != data && p.next_node
            p = p.next_node
            count += 1 
            return count if p.value == data
        end
        return nil
    end

    def to_s
        array = []
        return "Empty List" if !@start
        p = @start
        while p
            array << p.value
            p = p.next_node
        end
        return "( " + array.join(" ) -> ( ") + " ) -> nil"
    end

    def insert_at data,index
        if index == 0
            self.prepend(data)
            return
        end

        p = @start
        count = 1
        while count != index
            count += 1
            p = p.next_node
        end
        temp = Node.new(data)
        temp.next_node = p.next_node
        p.next_node = temp
    end

    def remove_at index
        if index == 0
            @start = @start.next_node
            return
        end

        p = @start
        count = 1
        while count != index
            count += 1
            p = p.next_node
        end
        p.next_node = p.next_node.next_node
    end

end