//
//  402. Remove K Digits - Medium.swift
//
//  Created by Artem Putelli on 12/04/24.
//
//  Intuition
//  Logically it may seem that we need to remove the largest numbers,
//  but this is not entirely true, since we need to take into account their position
//
//  Approach
//  We will take the elements of the array one by one and
//  Compare them with each other
//  If the previous number is greater we will remove it and
//  make it count -= 1 where count is the number of numbers needed to remove
//
//  Complexity
//  Time complexity:
//  O(n)
//  Space complexity:
//  O(n)
//

class Solution {
    func removeKdigits(_ num: String, _ k: Int) -> String {
        
        var count = k
        var stack : [Character] = []
        
        for number in num {
            while let last = stack.last, number < last, count > 0 {
                stack.removeLast()
                count -= 1
            }
            stack.append(number)
        }
        
        while count > 0 {
            stack.removeLast()
            count -= 1
        }
        
        while stack.first == "0" {
            stack.removeFirst()
        }
        
        return stack.isEmpty ? "0" : String(stack)
    }
}
