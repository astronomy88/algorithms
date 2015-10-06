class Queue

	attr_reader :queue, :tail, :head

	def initialize
		@head_pos = 0
		@tail_pos = 0
		@queue = Array.new(1)
	end

	def enqueue item
		resize(self.length * 2) if (@tail_pos > 0) && (@tail_pos == @queue.length)
		@queue[@tail_pos] = item
		@tail_pos +=1
		@queue
	end

	def length
		@tail_pos - @head_pos
	end

	def is_empty?
		return self.length == 0
	end

	def dequeue
		return nil if self.is_empty?
		temp = @queue[@head_pos]
		@queue[@head_pos] = nil
		@head_pos += 1
		#-- Start back at the beginning if head_pos has reached tail_pos
		(@head_pos = @tail_pos = 0) if (@head_pos == @tail_pos)
		
		#-- Shift to the beginning if @head is the size of length
		resize(@queue.length) if (@head_pos > 0) && (@head_pos == self.length)

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
			temp[i] = @queue[@head_pos+i]
		end
		@tail_pos = self.length
		@head_pos = 0
		@queue = temp
	end

	def each
		for i in 0..self.length-1
			yield @queue[@head_pos+i] if block_given?
		end
	end

end