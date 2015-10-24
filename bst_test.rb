require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require './bst'

class BinarySearchTreeTest < MiniTest::Test
  attr_accessor :tree

  # def test_it_starts_with_zero_elements
  #   tree = BinarySearchTree.new
  #   assert_equal 0, tree.count
  # end

  #TO DO Push
  # def test_it_pushes_an_element
  #   tree = BinarySearchTree.new
  #   tree.insert(1)
  #   assert_equal 1, tree.count
  # end

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
end

#     5 <- include?
#    / \
#   3   6 <- Tree[3].include?(7)
#  /   / \
#        7 <-
