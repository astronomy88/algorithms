class Stack

	attr_reader :length, :stack

	def initialize(size=1)
		@stack = Array.new(size)
		@length = 0
	end

	def is_empty?
		return @length == 0
	end

	def resize(max)
		temp = Array.new(max)
		for i in 0..@length-1
			temp[i] = @stack[i]
		end
		@stack = temp
	end

	def push item
		resize(@length * 2) if @length == @stack.length
		@stack[@length] = item
		@length += 1
		@stack
	end

	def pop
		#-- Don't pop if stack is empty
		return nil if self.is_empty?
		temp = @stack[@length - 1]
		@stack[@length - 1] = nil
		@length -= 1
		if (@length > 0 && @length == (@stack.length / 4))
			resize(@stack.length / 2)
		end
		temp
	end

	def each
		@length.downto(0) do |i|
			yield @stack[i] if block_given?
		end
	end


end