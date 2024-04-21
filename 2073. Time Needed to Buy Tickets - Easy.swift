//
//  2073. Time Needed to Buy Tickets - Easy.swift
//  
//  Created by Artem Putelli on 21/04/24.
//
//  Intuition
//  intuitively we can understand that we need to take into account the required number of
//  tickets and the length of the queue
//
//  Approach
//  We run a loop with the condition Tickets[k] != 0,
//  every time an element is removed from the array we do k = index < k ? k - 1 : k,
//  we also need to take time into account, so every iteration of the loop we do seconds += 1
//
//  Complexity
//  Time complexity:
//  O(n)
//  Space complexity:
//  O(n)

class Solution {
    func timeRequiredToBuy(_ tickets: [Int], _ k: Int) -> Int {
        
        var tickets = tickets
        var k = k
        
        var seconds = 0
        var queue = 0
        
        while tickets[k] != 0 {
            
            queue = queue >= tickets.count ? 0 : queue
            
            tickets[queue] -= 1
            
            if tickets[queue] == 0 && queue != k {
                tickets.remove(at: queue)
                k = queue < k ? k - 1 : k
            } else {
                queue += 1
            }
            
            seconds += 1
        }
        return seconds
    }
}
