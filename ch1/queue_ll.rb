require './node'

class QueueLinkedList

	attr_reader :length

	def initialize(item)
		@q = Node.new item
		@q.next = nil
		@current = @q
		#-- @current holds the item last queued, to keep track of the end of the queue
		#-- assign @current to the initial node
		@length = 1

	end

	def enqueue item

		if @q.nil?
			initialize item
		else
			#-- Grab the last node from previous time
			@last = @current

			@length += 1

			#-- Create the new node
			temp = Node.new(item)

			#-- Point the old node to the new node
			@last.next = temp

			#-- Save the current node for next time - reassigning @current now
			@current = temp
		end
	end

	def dequeue
		if @length == 0
			return nil
		end
			@length -= 1 

			#-- We are attempting to peel off from the first
			first = @q.item
			@q = @q.next
			first

	end

end