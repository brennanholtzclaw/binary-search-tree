A binary tree is built from nodes. Each node has:

A) An element of data
B) A link to the left. All nodes to the left have data elements less/lower than this node's data element.
C) A link to the right. All nodes to the right have data elementes more/greater than this node's data element.
Base Expectations

Build a binary search tree which can:

insert a new unique value into the tree
verify/reject the presence of a value in the tree with include?
report the depth of a node in the tree with depth_of
find the maximum value in the tree
find the minimum value in the tree
implement a sort that outputs an array of the values in sorted order (by traversing the tree, not using Ruby's sort method)
As the final challenge, add the ability to delete a value from the tree and repair the tree.

Beyond your tests, data should come in and go out using files:

import data from a file with one value per line (values are unique within the input)
output a file, similar to the input file, with the values in ascending order


# Nouns

* BinarySearchTree
  * element
  * left -> Node (smaller elements)
  * right -> Node (bigger elements)

# Verbs

* insert
* include?
* depth_of(node)
* count
