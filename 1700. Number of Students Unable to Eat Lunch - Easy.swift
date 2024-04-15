//
//  1700. Number of Students Unable to Eat Lunch - Easy.swift
//
//  Created by Artem Putelli on 15/04/24.
//
//  Intuition
//  We have to make sure that there is a student in line who will eat the sandwich on top of the pile
//
//  Approach
//  Under the condition students[0] != sandwiches[0] we check for the presence of a student in the array
//  for which the correct condition will be students[0] == sandwiches[0] otherwise we do not have access
//  to the underlying sandwiches and return the length of the entire queue
//
//  Complexity
//  Time complexity:
//  O(n)
//  Space complexity:
//  O(n)
//

class Solution {
    func countStudents(_ students: [Int], _ sandwiches: [Int]) -> Int {
        
        var students = students
        var sandwiches = sandwiches
        
        while !students.isEmpty {
            if students[0] == sandwiches[0] {
                students.removeFirst()
                sandwiches.removeFirst()
            } else {
                if sandwiches[0] == 0 {
                    if !students.contains(0) {
                        return students.count
                    }
                } else {
                    if !students.contains(1) {
                        return students.count
                    }
                }
                students.append(students.removeFirst())
            }
        }
        
        return 0
    }
}
