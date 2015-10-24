require './emptytree'

class BinarySearchTree
  attr_accessor :head, :right, :left

  def initialize
    @head
    @right = EmptyTree.new
    @left = EmptyTree.new
  end

  def insert(value)
    if head == nil
      self.head = value
    elsif value > head
      if right == EmptyTree.new
        self.right = value
      else
        right.insert(value)
      end
    else
      if left == EmptyTree.new
        tree = BinarySearchTree.new
        tree.insert(value)
        self.left = tree
      else
        left.insert(value)
      end
    end
  end



  def include?(value)
    if head == value
      true
    elsif right.include?(value)
      true
    elsif left.include?(value)
      true
    else
      false
    end
  end

end



#
# module BinaryTree
#   class Node
#
#     # named include? to parallel Array#include?
#     def include?(v)
#       case value <=> v
#       when 1 then left.include?(v)
#       when -1 then right.include?(v)
#       when 0 then true # the current node is equal to the value
#       end
#     end
#   end
# end

# def include?(value)
#   head == value || left.include?(value) || right.include?(value)
# end

# # State 1:
# tree 5
#
# # State 2:
# tree 5
#       \
#        7 tree.right
#
# # Going to State 3:
# # tree.insert(6) -> tree.right.insert(6)
# tree 5
#       \
#        7 tree.right

# class BinaryNode
#   attr_reader :value
#   attr_accessor :left, :right
#
#   def initialize(input_data)
#     @data = input_data
#   end
#
#   def link
#   end
# end
