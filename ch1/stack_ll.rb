require './node'

class StackLinkedList

	# attr_reader :length, :first
	attr_accessor :length, :first

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

end