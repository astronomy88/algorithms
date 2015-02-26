require_relative '../stack'


describe 'Stack' do
	it "resizes correctly" do
		stack = Stack.new
		stack.push 1
		stack.push 2
		expect(stack.stack.length).to eq(2)
	end

	it "Length should never be less than 0" do
		stack = Stack.new
		stack.push 1
		stack.push 2
		stack.push 3
		stack.pop
		stack.pop
		stack.pop
		stack.pop
		stack.pop
		expect(stack.length).to be > -1
	end

end
