//
//  42. Trapping Rain Water - Hard.swift
//
//  Created by Artem Putelli on 12/04/24.
//
//  Intuition
//  An intuitive approach is to determine the average wall size and the available depth.
//
//  Approach
//  to solve we have to find the maximum heights on the left and right
//  Then take the smaller height
//  Subtract the height where our current index is located so that we get the volume available to us for each position
//  I note that negative results should not be taken into account
//
//  Complexity
//  Time complexity:
//  O(n)
//  Space complexity:
//  O(n)
//

class Solution {
    func trap(_ height: [Int]) -> Int {
        
        var length = height.count - 1
        var result = 0
        
        var maxL = [0]
        var maxR = [0]
        
        var indexL = 0
        var indexR = length
        
        while indexR > 0 {
            maxL.append(max(height[indexL], maxL.last!))
            maxR.append(max(height[indexR], maxR.last!))
            indexL += 1
            indexR -= 1
        }
        
        maxR.reverse()
        
        for i in 0...length {
            result += max((min(maxL[i], maxR[i]) - height[i]),0)
        }
        
        return result
    }
}
