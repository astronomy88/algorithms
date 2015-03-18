require './node'

class StackLinkedList

	attr_reader :length

	def initialize(item)
		@first = Node.new(item)
		@first.next = nil
		@length = 1
	end

	def push item
		@length += 1
		oldfirst = @first
		@first = Node.new(item)
		@first.next = oldfirst
	end

	def pop
		return nil if @length == 0
		temp = @first.item
		@first = @first.next
		@length -= 1
		temp
	end

	def each
		current_node = @first
		for i in 1..@length
			if block_given?
				yield current_node.item
				current_node = current_node.next
			end
		end
	end

end