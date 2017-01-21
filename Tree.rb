require_relative "Node"

class Tree

	attr_reader :root

	def build_tree(array)
		@root = Node.new(array[0])
		for i in 1...array.size
			puts "placing #{array[i]}"
			current = @root
			placing = true
			while (placing)
				puts current.value
				if (current.value <= array[i])
					if (current.right == nil)
						current.right = Node.new(array[i])
						placing = false
					end
					current = current.right
				elsif (current.value > array[i])
					if (current.left == nil)
						current.left = Node.new(array[i])
						placing = false
					end
					current = current.left
				end
			end
		end
		puts "Done"
	end

	def initialize(array = nil)
		if (array != nil)
			build_tree(array)
		end
	end

	def breadth_first_search(value)
		queue = Array.new
		queue.push(@root)
		set = Array.new
		set.push(@root)
		while (queue.size != 0)
			puts "\nQueue: "
			for i in 0...queue.size
				print queue[i].value
				print ", "
			end
			currentNode = queue[0]
			#puts currentNode.value
			if (currentNode.value == value)
				return currentNode
			end
			queue = queue[1..queue.size]
			if (currentNode.left != nil && !set.include?(currentNode.left.value))
				queue.push(currentNode.left)
				set.push(currentNode.left.value)
			end
			if (currentNode.right != nil && !set.include?(currentNode.right.value))
				queue.push(currentNode.right)
				set.push(currentNode.right.value)
			end
		end
		return nil
	end

	def depth_first_search(value)
		stack = Array.new
		stack.push(@root)
		searching = true
		while (stack.size != 0)
			for i in 0...stack.size
				print stack[i].value
				print ", "
			end
			currentNode = stack.pop
			if (currentNode.value == value)
				return currentNode
			end
			if (currentNode.left != nil && stack)
				stack.push(currentNode.left)
			end
			if (currentNode.right != nil)
				stack.push(currentNode.right)
			end
		end
	end

end

t = Tree.new([3, 1, 5, 7, 12, 1, 6])
node = t.breadth_first_search(55)
if (node == nil)
	puts "SUCCESS"
end

puts "\n\n\n"
newNode = t.depth_first_search(12)
puts "\n#{newNode.value}"