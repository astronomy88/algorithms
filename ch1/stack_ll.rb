require './node'

class StackLinkedList

	attr_reader :length

	def initialize(item)
		@first = Node.new(item)
		@first.next = nil
		@length = 0
	end

	def push item
		@length += 1
		oldfirst = @first
		@first = Node.new(item)
		@first.next = oldfirst
	end

	def pop
		temp = @first.item
		@first = @first.next
	end

end