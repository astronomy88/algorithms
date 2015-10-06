require './node'

class QueueLinkedList

	attr_reader :length

	def initialize(item)
		@first = Node.new item
		@first.next = nil
		@current = @first
		#-- changes to @current will affect @first, 
		#   because they are references to the same object
		@length = 1

	end

	def enqueue item
		@length += 1

		#-- Get the past node
		oldnode = @current

		#-- Create the new node
		newnode = Node.new(item)

		#-- Point the old node to the new node
		oldnode.next = newnode

		#-- Save the current node for next time
		@current = newnode
	end

	def dequeue
		if @length == 0
			return nil
		end

		@length -= 1 
		temp = @first.item
		@first = @first.next
		temp
	end

end