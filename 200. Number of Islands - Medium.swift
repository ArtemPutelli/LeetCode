//
//  200. Number of Islands - Medium.swift
//  
//  Created by Artem Putelli on 19/04/24.
//
//  Intuition
//  We can imagine that we are solving a problem in real life,
//  for this we need to look at the map with our eyes and
//  count how many separate zones the earth occupies;
//  as soon as our gaze falls on the first cell of the earth,
//  we will immediately mark all neighboring cells
//
//  Approach
//  This is exactly how this problem is solved, we go through our map, looking at each cell ,
//  and as soon as we come across a land cell,
//  we recursively run along the perimeter of each subsequent land cell and mark it as read,
//  i.e. we simply replace the symbol on our map
//
//  Complexity
//  Time complexity:
//  O(n)
//  Space complexity:
//  O(n)

class Solution {
    func numIslands(_ grid: [[Character]]) -> Int {
        
        var grid = grid
        var islands = 0
        
        for i in 0..<grid.count {
            for j in 0..<grid[i].count {
                if grid[i][j] == "1" {
                    islands += 1
                    removeIsland(i, j, &grid)
                }
            }
        }
        
        return islands
    }
    
    func removeIsland(_ i: Int, _ j: Int, _ grid: inout [[Character]]) {
        if i < 0 || i >= grid.count || j < 0 || j >= grid[i].count || grid[i][j] != "1" { return }
        grid[i][j] = "x"
        removeIsland(i + 1, j, &grid)
        removeIsland(i, j + 1, &grid)
        removeIsland(i - 1, j, &grid)
        removeIsland(i, j - 1, &grid)
    }
}
