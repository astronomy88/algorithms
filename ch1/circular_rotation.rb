s = "ACTGACG"
t = "TGACGAC"

puts "s: #{s}"
puts "t: #{t}"

puts "s+s: #{s+s}"

ss = s+s

if !(ss.index t).nil?
	puts "s is a circular rotation of t!"
else
	puts "s is NOT a circular rotation of t."
end