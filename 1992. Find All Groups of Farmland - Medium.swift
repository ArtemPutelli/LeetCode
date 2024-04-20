//
//  1992. Find All Groups of Farmland - Medium.swift
//  
//  Created by Artem Putelli on 20/04/24.
//
//  Intuition
//  The logical solution is to represent the problem in the real world and consider it here,
//  in which case we can easily translate the solution from our world into code.
//
//  Approach
//  We will go around our map one by one checking each cell, as soon as we come across the cell we need,
//  we should run the recursive DFS function which will bypass the already nested section of the map,
//  find the coordinates necessary for our conditions and add them to the coordinates array,
//  to avoid going through sections again, we should mark them as read
//
//  Complexity
//  Time complexity:
//  O(n)
//  Space complexity:
//  O(n)

class Solution {
    func findFarmland(_ land: [[Int]]) -> [[Int]] {

        var coordinates: [[Int]] = [], land = land

        for indexOne in 0...land.count - 1 {
            for indexTwo in 0...land[0].count - 1 {
                if land[indexOne][indexTwo] == 1 {
                    coordinates.append([indexOne,indexTwo])
                    dfs(indexOne, indexTwo, &land, &coordinates)
                }
            }
        }

        return coordinates
    }
    private func dfs (_ indexOne: Int, _ indexTwo: Int, _ land: inout [[Int]], _ coordinates: inout [[Int]]) {
        guard indexOne >= 0 && indexOne < land.count && indexTwo >= 0 && indexTwo < land[0].count && land[indexOne][indexTwo] == 1 else { return }

        land[indexOne][indexTwo] = 8

        if (indexOne + 1 < land.count && indexTwo + 1 < land[0].count && land[indexOne + 1][indexTwo] == 0 && land[indexOne][indexTwo + 1] == 0)
            || (indexOne + 1 < land.count && land[indexOne + 1][indexTwo] == 0 && indexTwo + 1 >= land[0].count)
            || (indexTwo + 1 < land[0].count && land[indexOne][indexTwo + 1] == 0 && indexOne + 1 >= land.count )
            || (indexOne + 1 == land.count && indexTwo + 1 == land[0].count) {
            
            coordinates[coordinates.count - 1].append(indexOne)
            coordinates[coordinates.count - 1].append(indexTwo)
            
            return
        }

        dfs(indexOne, indexTwo + 1, &land, &coordinates)
        dfs(indexOne + 1, indexTwo, &land, &coordinates)
    }
}
