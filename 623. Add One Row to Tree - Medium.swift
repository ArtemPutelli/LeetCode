//
//  623. Add One Row to Tree - Medium.swift
//  
//  Created by Artem Putelli on 16/04/24.
//
//  Intuition
//  logically we understand that we need to replace the node with a new one,
//  specifying the old one as a child node
//
//  Approach
//  To do this, we traverse our binary tree using a recursive function,
//  at each iteration of the loop we check whether we have reached the desired node and if this is true,
//  then we replace the current node with a new one
//
//  Note
//  it is very important to consider that if it is necessary to replace the very first node of our binary tree,
//  then we create a new binary tree
//
//  Complexity
//  Time complexity:
//  O(n)
//  Space complexity:
//  O(n)

class Solution {
    
    func addOneRow(_ root: TreeNode?, _ val: Int, _ depth: Int) -> TreeNode? {
        
        guard depth > 1 else { return TreeNode(val, root, nil) }
        
        dfs(root, val, depth - 1, 1)
        
        return root
    }
    
    func dfs ( _ node: TreeNode?, _ val: Int, _ depth: Int, _ counter: Int) {
        
        guard node != nil else { return }
        
        if depth == counter {
            node?.left = TreeNode(val, node?.left, nil)
            node?.right = TreeNode(val, nil, node?.right)
        } else {
            dfs(node?.left, val, depth, counter + 1)
            dfs(node?.right, val, depth, counter + 1)
        }
        
    }
}
