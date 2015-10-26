require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require './bst'

class BinarySearchTreeTest < MiniTest::Test
  attr_accessor :tree

  def test_it_starts_with_zero_elements
    tree = BinarySearchTree.new
    assert_equal 0, tree.count
  end

  def test_it_inserts_an_element
    tree = BinarySearchTree.new
    tree.insert(1)
    assert_equal 1, tree.count
  end

  def test_it_counts_a_larger_range
    tree = BinarySearchTree.new
    tree.insert(10)
    rnga = (1..9)
    rngb = (11..20)
    rnga.each {|value| tree.insert(value)}
    rngb.each {|value| tree.insert(value)}
    assert_equal 20, tree.count
  end

  def test_it_rejects_a_duplicate_value
    tree = BinarySearchTree.new
    tree.insert(5)
    tree.insert(5)
    assert "Sorry, that value is already in here."
  end

  def test_it_insertes_a_bigger_element_than_head_to_the_right
    tree = BinarySearchTree.new
    tree.insert(5)
    tree.insert(6)
    assert_equal 6, tree.right.head
    assert_equal nil, tree.left
  end

  def test_it_inserts_a_smaller_element_than_head_to_the_left
    tree = BinarySearchTree.new
    tree.insert(5)
    tree.insert(4)
    assert_equal nil, tree.right
    assert_equal 4, tree.left.head
  end

  def test_it_inserts_three_ascending_elements_correctly
    tree = BinarySearchTree.new
    tree.insert(5)
    tree.insert(7)
    tree.insert(6)
    assert_equal 6, tree.right.left.head
  end

  def test_it_inserts_other_three_lesser_elements_correctly
    tree = BinarySearchTree.new
    tree.insert(5)
    tree.insert(3)
    tree.insert(4)
    assert_equal 4, tree.left.right.head
  end

  def test_it_inserts_strings
    tree = BinarySearchTree.new
    tree.insert("c")
    tree.insert("b")
    tree.insert("d")
    assert_equal "d", tree.right.head
  end

  def test_it_inserts_more_complex_strings
    tree = BinarySearchTree.new
    tree.insert("cat")
    tree.insert("bat")
    tree.insert("dog")
    assert_equal "dog", tree.right.head
  end

  def test_it_includes_single_value
    tree = BinarySearchTree.new
    tree.insert(5)
    assert tree.include?(5)
  end

  def test_it_does_not_include_when_empty
    tree = BinarySearchTree.new
    refute tree.include?(5)
  end

  def test_it_includes_a_lesser_value
    tree = BinarySearchTree.new
    tree.insert(5)
    tree.insert(3)
    assert tree.include?(3)
  end

  def test_it_includes_a_greater_value
    tree = BinarySearchTree.new
    tree.insert(5)
    tree.insert(6)
    assert tree.include?(6)
  end

  def test_it_includes_a_second_greater_and_lesser_value
    tree = BinarySearchTree.new
    tree.insert(5)
    tree.insert(6)
    tree.insert(7)
    tree.insert(4)
    tree.insert(3)
    assert tree.include?(7)
    assert tree.include?(3)
  end

  def test_it_does_not_include_a_value_with_head
    tree = BinarySearchTree.new
    tree.insert(5)
    tree.insert(6)
    tree.insert(4)
    assert_equal tree.include?(13), false
  end

  def test_it_rejects_maximum_while_empty
    tree = BinarySearchTree.new
    refute tree.maximum
  end

  def test_it_reports_maximum_with_single_element
    tree = BinarySearchTree.new
    tree.insert(1)
    assert_equal 1, tree.maximum
  end

  def test_it_reports_maximum_with_two_elements
    tree = BinarySearchTree.new
    tree.insert(1)
    tree.insert(2)
    assert_equal 2, tree.maximum
  end

  def test_it_reports_maximum_with_multiple_elements
    tree = BinarySearchTree.new
    tree.insert(4)
    tree.insert(3)
    tree.insert(5)
    assert_equal 5, tree.maximum
  end

  def test_it_reports_maximum_with_multiple_levels
    tree = BinarySearchTree.new
    tree.insert(4)
    tree.insert(3)
    tree.insert(2)
    tree.insert(5)
    tree.insert(1)
    tree.insert(6)
    assert_equal 6, tree.maximum
  end

  def test_it_rejects_minimum_while_empty
    tree = BinarySearchTree.new
    refute tree.minimum
  end

  def test_it_reports_minimum_with_single_element
    tree = BinarySearchTree.new
    tree.insert(1)
    assert_equal 1, tree.minimum
  end

  def test_it_reports_minimum_with_two_elements
    tree = BinarySearchTree.new
    tree.insert(1)
    tree.insert(2)
    assert_equal 1, tree.minimum
  end

  def test_it_reports_minimum_with_multiple_elements
    tree = BinarySearchTree.new
    tree.insert(4)
    tree.insert(3)
    tree.insert(5)
    assert_equal 3, tree.minimum
  end

  def test_it_reports_minimum_with_multiple_levels
    tree = BinarySearchTree.new
    tree.insert(4)
    tree.insert(3)
    tree.insert(2)
    tree.insert(5)
    tree.insert(1)
    tree.insert(6)
    assert_equal 1, tree.minimum
  end

  def test_it_reports_depth_with_no_elements
    tree = BinarySearchTree.new
    tree.depth_of(1)
    assert "It's empty in here!"
  end
  def test_it_reports_depth_with_one_element
    tree = BinarySearchTree.new
    tree.insert(1)
    assert_equal 0, tree.depth_of(1)
  end

  def test_it_reports_depth_with_two_elements
    tree = BinarySearchTree.new
    tree.insert(1)
    tree.insert(2)
    assert_equal 1, tree.depth_of(2)
  end

  def test_it_reports_depth_with_three_levels
    tree = BinarySearchTree.new
    tree.insert(4)
    tree.insert(3)
    tree.insert(5)
    tree.insert(6)
    tree.insert(2)
    tree.insert(1)
    tree.insert(7)
    assert_equal 3, tree.depth_of(7)
  end

  def test_it_reports_depth_with_three_levels
    tree = BinarySearchTree.new
    tree.insert(10)
    rnga = (1..9)
    rngb = (11..20)
    rnga.each {|value| tree.insert(value)}
    rngb.each {|value| tree.insert(value)}
    assert_equal 9, tree.depth_of(19)
  end

  def test_it_does_not_sort_empty_tree
    tree = BinarySearchTree.new
    assert_equal "This is an empty tree", tree.sort
  end

  def test_it_sorts_single_element_tree
    tree = BinarySearchTree.new
    tree.insert(1)
    assert_equal [1], tree.sort
  end

  # def test_it_sorts_multiple_elements_in_tree
  #   tree = BinarySearchTree.new
  #   tree.insert(1)
  #   tree.insert(4)
  #   tree.insert(3)
  #   tree.insert(5)
  #   tree.insert(6)
  #   tree.insert(2)
  #   tree.insert(7)
  #   assert_equal [1, 2, 3, 4, 5, 6, 7], tree.sort
  # end



end
