require './node'

class QueueLinkedList

	attr_reader :last, :first

	def initialize(item)
		@first = Node.new item
		@first.next = nil
		@current = @first
		@length = 1
	end

	def enqueue item
		@length += 1

		newnode = Node.new(item)
		@first.next = newnode

		newnode.next = @current
		@current = newnode

		# @first.next = newnode

	end

	def dequeue
		temp = @current.item
		@current = @current.next
		temp
	end

end