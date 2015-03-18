require './stack_ll'

test = StackLinkedList.new("1")

test.push 2
test.push 3
test.push 4

test.each { |x| puts x }