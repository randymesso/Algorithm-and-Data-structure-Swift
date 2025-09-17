/*
 Given an array of integers, return the indices of the two numbers that add up to a target.
 Input: [2, 7, 11, 15], target = 9 → Output: [0, 1]
 
 Features:
 Time: O(n) — one pass over nums, constant-time dictionary lookups/insertions on average.
 Space: O(n) — worst-case dictionary storing each number once.
 Lookup:
 Average-case lookup (access by key): O(1) — constant time.
 Worst-case lookup: O(n) — if too many keys end up in the same hash bucket (hash collisions).
 */

func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
    // Dictionary to store numbers we've seen and their indices
    var seenNumbers: [Int: Int] = [:]
    
    for index in 0..<nums.count {
        let current = nums[index]
        let complement = target - current
        
        // If we’ve seen the complement before, we’ve found our answer
        if let complementIndex = seenNumbers[complement] {
            return [complementIndex, index]
        }
        
        // Store the current number with its index
        seenNumbers[current] = index
    }
    
    // If no solution is found (though the problem guarantees one)
    return []
}
