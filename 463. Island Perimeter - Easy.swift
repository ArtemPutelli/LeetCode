//
//  463. Island Perimeter - Easy.swift
//  
//  Created by Artem Putelli on 18/04/24.
//
//  Intuition
//  Intuitively we understand that for the solution we can use one nested loop,
//  thanks to which we will have access to each cell of the map
//
//  Approach
//  We will go through each cell of the map and each time we land on the ground,
//  we will look around in a circle and ask ourselves whether it is water or not,
//  and if it is water, then we will add the length of the cell to the perimeter.
//
//  Complexity
//  Time complexity:
//  O(n)
//  Space complexity:
//  O(1)
                                    
class Solution {
    func islandPerimeter(_ grid: [[Int]]) -> Int {
        var perimeter = 0
        var height = grid.count - 1
        var length = grid[0].count - 1
        for indexOne in 0...height {
            for indexTwo in 0...length {
                if grid[indexOne][indexTwo] == 1 {
                    // checking top
                    if (indexOne - 1) >= 0 {
                        if grid[indexOne - 1][indexTwo] == 0 { perimeter += 1 }
                    } else { perimeter += 1 }
                    // checking bottom
                    if (indexOne + 1) <= height {
                        if grid[indexOne + 1][indexTwo] == 0 { perimeter += 1 }
                    } else { perimeter += 1 }
                    // checking left
                    if (indexTwo - 1) >= 0 {
                        if grid[indexOne][indexTwo - 1] == 0 { perimeter += 1 }
                    } else { perimeter += 1 }
                    // checking righte
                    if (indexTwo + 1) <= length {
                        if grid[indexOne][indexTwo + 1] == 0 { perimeter += 1 }
                    } else { perimeter += 1 }
                }
            }
        }
        return perimeter
    }
}
