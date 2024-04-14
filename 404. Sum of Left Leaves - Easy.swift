//
//  404. Sum of Left Leaves - Easy.swift
//  
//  Created by Artem Putelli on 14/04/24.
//
//  Intuition
//  intuitively we can understand that we need to traverse the tree,
//  find the last left nodes of the tree, that is leaves, and return their sum
//
//  Approach
//  we call our function recursively, each iteration we take the values ​​stored in the node,
//  provided that it does not have a right and left child element,
//  then we sum the found objects and return the sum
//
//  Complexity
//  Time complexity:
//  O(n)
//  Space complexity:
//  O(1)

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
