//
//  988. Smallest String Starting From Leaf - Medium.swift
//  
//  Created by Artem Putelli on 17/04/24.
//
//  Intuition
//  Logically we can understand that we must use a recursive approach since
//  the brute force approach will not work here due to the stated conditions of the problem
//
//  Approach
//  To solve the problem, we use two global variables in one store the smallest received
//  string in the other, our characters from which the string is formed.
//
//  We will recursively traverse our binary tree, collecting the stored values,
//  when we reach the last node we will compare the resulting string with the one stored
//  in the global variable and if the resulting string is smaller, we will store it,
//  after a full traversal binary tree we will return the smallest string
//
//  Complexity
//  Time complexity:
//  O(n)
//  Space complexity:
//  O(n)

class Solution {
    
    let chars: [Character] = Array("abcdefghijklmnopqrstuvwxyz")
    var smallest = "~"
    
    func smallestFromLeaf(_ root: TreeNode?) -> String {
        
        guard let root = root else { return "" }
        
        dfs(root, "")
        
        return smallest
    }
    
    func dfs(_ node: TreeNode?, _ next: String) {
        
        guard let node = node else { return }

        let current = String(chars[node.val]) + next
        
        if node.left == nil && node.right == nil {
            smallest = min(smallest, current)
        }
        
        dfs(node.left, current)
        dfs(node.right, current)
    }
}
