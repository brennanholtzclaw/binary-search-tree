require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require './untitiled2'

class NodeTest < MiniTest::Test
  attr_accessor :tree

  # def test_it_starts_with_zero_elements
  #   tree = BinarySearchTree.new
  #   assert_equal 0, tree.count
  # end

  #TO DO Push
  # def test_it_pushes_an_element
  #   tree = BinarySearchTree.new
  #   tree.push(1)
  #   assert_equal 1, tree.count
  # end

  def test_it_insertes_a_bigger_element_than_head_to_the_right
    tree = Node.new(4)
    tree.push(5)
    tree.push(6)
    assert_equal 6, tree.right.head
    assert_equal nil, tree.left
  end

  def test_it_pushs_a_smaller_element_than_head_to_the_left
    tree = Node.new(4)
    tree.push(5)
    tree.push(4)
    assert_equal nil, tree.right
    assert_equal 4, tree.left.head
  end

  def test_it_pushs_three_elements_correctly
    tree = Node.new(4)
    tree.push(5)
    tree.push(7)
    tree.push(6)
    assert_equal 6, tree.right.left.head
  end

  def test_it_pushs_other_three_elements_correctly
    tree = Node.new(4)
    tree.push(5)
    tree.push(3)
    tree.push(4)
    assert_equal 4, tree.left.right.head
  end

  def test_it_includes_a_value
    tree = Node.new(4)
    tree.push(5)
    tree.push(3)
    tree.push(6)
    tree.push(7)

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
