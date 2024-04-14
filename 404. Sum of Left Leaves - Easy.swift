//
//  404. Sum of Left Leaves - Easy.swift
//  
//  Created by Artem Putelli on 14/04/24.
//
//  Intuition
//  intuitively we can understand that we need to traverse the tree,
//  find the last left nodes of the tree that do not have node,
//  that is, leaves, and return their sum
//
//  Approach
//  we recursively call our function that takes the values of the left node,
//  provided that it does not have a right child and a left child,
//  then sum the objects found and return the sum
//
//  Complexity
//  Time complexity:
//  O(n)
//  Space complexity:
//  O(n)
//

class Solution {
    var sumLeftLeaves = 0
    func sumOfLeftLeaves(_ root: TreeNode?) -> Int {
        if root == nil { return 0 }
        if root!.left != nil && root!.left!.left == nil && root!.left!.right == nil {
            sumLeftLeaves += root!.left!.val
        }
        sumOfLeftLeaves(root!.left)
        sumOfLeftLeaves(root!.right)
        return sumLeftLeaves
    }
}
