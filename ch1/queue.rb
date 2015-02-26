class Queue

	attr_reader :queue

	def initialize
		@head = 0
		@tail = 0
		@queue = Array.new(1)
	end

	def enqueue item
		@queue[@tail] = item
		resize(self.length * 2) if (@tail > 0) && (@tail == @queue.length)
		@tail +=1
		@queue
	end

	def length
		@tail - @head
	end

	def is_empty?
		return self.length == 0
	end

	def dequeue
		return nil if self.is_empty?
		temp = @queue[@head]
		@queue[@head] = nil
		@head += 1
		(@head = @tail = 0) if (@head == @tail)
		
		#-- Shuffle to the beginning if @head is the size of length
		resize(@queue.length) if (@head > 0) && (@head == self.length)

		#-- Shorten array if length is 1/4 the array size
		if (self.length > 0) && (self.length == @queue.length / 4)
			resize(@queue.length/2) 
		end

		temp
	end

	def resize(max)
		temp = Array.new(max)

		#-- Shift the elements to the beginning when copying
		for i in 0..self.length-1
			temp[i] = @queue[@head+i]
		end
		@tail = self.length
		@head = 0
		@queue = temp
	end

end