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
    elsif include?(value)
      "Sorry, that value is already in here."
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
      "It's empty in here!"
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
    else
      sort_tree(head)
    end
  end

  def sort_tree(head)
    if
      @sorted_array = sort_tree(left)
    end
    @sorted_array << head
    if self.right
      @sorted_array = sort_tree(right)
    end
    @sorted_array
  end
end
