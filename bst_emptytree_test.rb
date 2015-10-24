require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require './bst_empty'
require './emptytree'

class BinarySearchTreeTest < MiniTest::Test
  attr_accessor :tree

  # def test_it_starts_with_zero_elements
  #   tree = BinarySearchTree.new
  #   assert_equal 0, tree.count
  # end

  # TO DO Push
  def test_it_inserts_an_element
    tree = BinarySearchTree.new
    tree.insert(1)
    assert_equal 1, tree.head
  end

  def test_it_inserts_a_bigger_element_than_head_to_the_right
    tree = BinarySearchTree.new
    tree.insert(5)
    tree.insert(6)
    assert_equal 6, tree.right.head
    assert_equal EmptyTree.new, tree.left
  end

  def test_it_inserts_a_smaller_element_than_head_to_the_left
    tree = BinarySearchTree.new
    tree.insert(5)
    tree.insert(4)
    assert_equal EmptyTree.new, tree.right
    assert_equal 4, tree.left.head
  end

  def test_it_inserts_three_elements_correctly
    tree = BinarySearchTree.new
    tree.insert(5)
    tree.insert(7)
    tree.insert(6)
    assert_equal 6, tree.right.left.head
  end

  def test_it_inserts_other_three_elements_correctly
    tree = BinarySearchTree.new
    tree.insert(5)
    tree.insert(3)
    tree.insert(4)
    assert_equal 4, tree.left.right.head
  end

  def test_it_includes_a_value
    tree = BinarySearchTree.new
    tree.insert(5)
    tree.insert(3)
    tree.insert(6)
    tree.insert(7)

    assert tree.include?(5)
    assert tree.include?(3)
    assert tree.include?(7)
    refute tree.include?(13)
  end
end

#     5 <- include?
#    / \
#   3   6 <- Tree[3].include?(7)
#  /   / \
#        7 <-
