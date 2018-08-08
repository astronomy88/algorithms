require 'pry'
#-- Let's work in 8 bits to start:
#-- So highest value is: 11111111, or 1 + 2 + 4 + 8 +  = 255

#-- Suppose we want to add two bits. Lets get these as strings.

#-- Adding 2 + 5:
#   10 + 101
#-- This should equal 7:
#   111 ( and it does )

def pow_of_2(int)
	if int <= 0
		return 1
	end

	int -= 1
	return 2 * pow_of_2(int)
end

#-- Let's write a function to convert a string of bits into a number. 
#   Assume this is outside the scope of the problem, and just used to debug
def binary_to_int(bitstring)
	int = 0
	#-- Loop through the chars
	bitstring.reverse.each_char.with_index do |char, index|
		if char != '0' && char != '1'
			puts "This is not a valid binary representation. Bye."
			break
		end
    if char == '1'
    	int += pow_of_2(index)
    end
	end
	return int
end

def int_to_bitstring(int)
	#-- Keep getting a power of 2 until it's larger than the int
	#-- Assume our int is at most 8 bits
	result = ''
	(7).downto(0).each do |i|
		current_pow_2 = pow_of_2(i)
		if current_pow_2 > int
			result.concat '0'
		else
			result.concat '1'
			int = int - current_pow_2
		end
	end
	return result
end

#-- Let's go through all the bitwise operators.

#-- bitwise and, &
#-- This operator returns 1 when both of the digits in the same column are the same value.
# E.g., 1101 & 1001 = 1011
#-- here, a and b are two bit strings that are 8 chars long
def bitwise_and(a, b)
	result = ''
	a.each_char.with_index do |val, index|
		if val == b[index]
			result.concat '1'
		else
			result.concat '0'
		end
	end
	return result
end

puts "Testing &: #{bitwise_and('1101', '1001')} should be '1011'"

#-- bitwise or, |, sets bit to 1 as long as either of the values in the same column is 1
def bitwise_or(a, b)
	result = ''
	a.each_char.with_index do |val, index|
		if val == '1' || b[index] == '1'
			result.concat '1'
		else
			result.concat '0'
		end
	end
	return result
end

puts "Testing |: #{bitwise_or('1101', '1001')} should be '1101'"

#-- bitwise exclusive, or ^, will set bit to 1 if only one of the bits is 1
def bitwise_exclusive(a, b)
	result = ''
	a.each_char.with_index do |val, index|
		if (val == '1' && b[index] == '0') || (val == '0' && b[index] == '1')
			result.concat '1'
		else
			result.concat '0'
		end
	end
	return result
end

puts "Testing ^: #{bitwise_exclusive('1101', '1001')} should be '0100'"

#-- bitwise not, or ~, will flip the bits in each column
def bitwise_not(a)
	result = ''
	a.each_char do |val|
		if val == '1' 
			result.concat '0'
		else
			result.concat '1'
		end
	end
	return result
end

puts "Testing ~: #{bitwise_not('1101')} should be '0010'"

#-- bitwise logical left, <<, will shift an integers bits left by that many values
#   Shift 'a' left by 'n' places
def bitshift_left(a, n)
	if n > 7 || n < 0
		puts "Sorry, n is not in a good range"
		return
	end

	add_zero = ''
	(1).upto(n).each do
		add_zero.concat '0'
	end
	return a[n..7].concat add_zero

end

puts "Left  shifting '00001111' by 3: #{bitshift_left('00001111', 3)}"

#-- bitwise logical right, >>, will shift an integers bits right by that many values
#   Shift 'a' right by 'n' places
def bitshift_logical_right(a, n)
	if n > 7 || n < 0
		puts "Sorry, n is not in a good range"
		return
	end

	add_zero = ''
	(1).upto(n).each do
		add_zero.concat '0'
	end
	return add_zero.concat(a[0..7-n])

end

puts "Logical Right shifting '00001111' by 3: #{bitshift_logical_right('00001111', 3)}"

#-- bitwise arithmitic right, >>, will shift an integers bits right by that many values and top bit is copied
#   Shift 'a' right by 'n' places
def bitshift_arithmetic_right(a, n)
	if n > 7 || n < 0
		puts "Sorry, n is not in a good range"
		return
	end

	add_topbit = ''
	(1).upto(n).each do
		add_topbit.concat a[0]
	end
	return add_topbit.concat(a[0..7-n])[0..7]

end

puts "\nArithmetic Right shifting '00011111' by 3: #{bitshift_arithmetic_right('00011111', 3)}"
puts "Arithmetic Right shifting '10011111' by 3: #{bitshift_arithmetic_right('10011111', 3)}"

#-- Now to add two binary
def bit_add(a, b)
	(7).downto(0).each do |x|
	end
end

binding.pry