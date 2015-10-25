class BinarySearchTree
  attr_accessor :head, :right, :left

  def count
    if head.nil?
      0
    elsif right.nil? && left.nil?
      1
    elsif left && right.nil?
      1 + left.count
    elsif right && left.nil?
      1 + right.count
    else
      1 + left.count + right.count
    end
  end


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


  def sort
    @sorted_array = []
    if head.nil?
      "This is an empty tree"
    elsif left == true && right.nil?
      left.sort_tree(head)
    elsif right == true && right.nil?
      right.sort_tree(head)
    elsif right.nil? && left.nil?
      head.sort_tree(head)
    end
  end


  def sort_tree(head)
    if right.nil? && left.nil?
      @sorted_array << @head
    elsif left == true && right.nil?
      left.sort
    elsif right == true && left.nil?
      right.sort
    end
  end

#
#   def push(node)
#   if node.data < data
#     add_node_to_left_link(node)
#   elsif node.data > data
#     add_node_to_right_link(node)
#   else
#     return_duplicate_node_message(node)
#   end
# end

# def sort
#     return [data] if no_links_exist
#
#     sorted = []
#
#     if only_left_link_exists
#       sorted.push(left.sort).push(data)
#     elsif only_right_link_exists
#       sorted.push(data).push(right.sort)
#     else
#       sorted.push(left.sort).push(data).push(right.sort)
#     end
#
#     sorted.flatten
#   end
end
