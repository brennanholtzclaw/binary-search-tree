require './emptytree'

class BinarySearchTree
  attr_accessor :head, :right, :left

  # def initialize
  #   @head
  #   @right = EmptyTree.new
  #   @left = EmptyTree.new
  # end

  def insert(value)
    if head.nil?
      self.head = value
    elsif value > head
      if right.nil?
        tree = BinarySearchTree.new
        tree.insert(value)
        self.right = tree
      else
        right.insert(value)
      end
    else
      if left.nil?
        tree = BinarySearchTree.new
        tree.insert(value)
        self.left = tree
      else
        left.insert(value)
      end
    end
  end


  def include?(value)
    if head.nil?
      false
    elsif head == value
      true
    elsif value > head && right
      right.include?(value)
    elsif value < head && left
      left.include?(value)
    else
      false
    end
  end

  def maximum
    if head.nil?
      false
    elsif head && right.nil?
      return head
    else
      right.maximum
    end
  end

  def minimum
    if head.nil?
      false
    elsif head && left.nil?
      return head
    else
      left.minimum
    end
  end


  def depth_of(value)
    if head == value
      0
    elsif head.nil?
      puts "It's empty in here!"
    elsif value > head
      1 + right.depth_of(value)
    elsif value > head
      1 + left.depth_of(value)
    end
  end

  #
  # def counter
  #   @counter = 0
  # end
  #
  # def depth_of(value)
  #   if head == value
  #     @counter
  #   elsif head.nil?
  #     puts "It's empty in here!"
  #   elsif head == value
  #     0
  #   elsif value > head
  #     right.depth_of(value)
  #     @counter += 1
  #   elsif value > head
  #     left.depth_of(value)
  #     @counter += 1
  #   end
  # end
  #
  # def depth_of(value)
  #   counter = 0
  #   if head.nil?
  #     puts "It's empty in here!"
  #   elsif head == value
  #     0
  #   elsif value > head
  #     right.depth_of(value)
  #     counter += 1
  #   elsif value > head
  #     left.depth_of(value)
  #     counter += 1
  #   else
  #     puts "That value isn't in here"
  #   end
  #   counter
  # end


  def sort
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


    # def include?(value)
    #   if head.nil?
    #     false
    #   else
    #     if head.nil?
    #       false
    #     else
    #       case head <=> value
    #       when 1 then left.include?(value)
    #       when -1 then right.include?(value)
    #       when 0 then true
    #       end
    #     end
    #   end
    # end
      # if head == value
      #   true
      # elsif @right == value
      #   true
      # elsif @left == value
      #   true
      # else
      #   false
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
