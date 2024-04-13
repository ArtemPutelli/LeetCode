//
//  950. Reveal Cards In Increasing Order - Medium.swift
//  
//  Created by Artem Putelli on 13/04/24.
//
//  Intuition
//  intuitively it may seem that you need to sort the array sorted(by: >)
//  but this is not entirely true
//
//  Approach
//  we need to fill our queue observing a step of one index,
//  provided that we do not take into account already used indices and maps
//
//  Complexity
//  Time complexity:
//  O(n)
//  Space complexity:
//  O(n)
//

class Solution {
    func deckRevealedIncreasing(_ deck: [Int]) -> [Int] {

        var deck = deck.sorted(by: >)
        var queue : [Int] = [deck.removeFirst()]

        for card in deck {
            queue.insert(queue.popLast()!, at: 0)
            queue.insert(card, at: 0)
        }
        
        return queue
    }
}
