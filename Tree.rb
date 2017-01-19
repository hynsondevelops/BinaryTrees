require_relative "Node"

class Tree

	attr_reader :root

	def build_tree(array)
		@root = Node.new(array[0])
		current = @root.value
		for i in 1...array.size
			if (current > array[i])
				@root.right = Node.new(array[i])
			elsif (current < array[i])
				@root.left = Node.new(array[i])
			end
			puts i
		end
	end

	def initialize(array = nil)
		if (array != nil)
			build_tree(array)
		end
	end
end

t = Tree.new([3, 1, 5])
puts t.root.value
puts t.root.left.value
puts t.root.right.value