/*
 Given an unsorted array of integers nums, return the length of the longest consecutive elements sequence.
 
 You must write an algorithm that runs in O(n) time.
 
 
 
 Example 1:
 
 Input: nums = [100,4,200,1,3,2]
 Output: 4
 Explanation: The longest consecutive elements sequence is [1, 2, 3, 4]. Therefore its length is 4.
 Example 2:
 
 Input: nums = [0,3,7,2,5,8,4,6,0,1]
 Output: 9
 Example 3:
 
 Input: nums = [1,0,1,2]
 Output: 3
 */

func longestConsecutive(_ nums: [Int]) -> Int {
    let numSet = Set(nums)
    var longest = 0
    
    for num in numSet {
        // Only start a sequence if it's the first number
        if !numSet.contains(num - 1) {
            var currentNum = num
            var currentStreak = 1
            
            while numSet.contains(currentNum + 1) {
                currentNum += 1
                currentStreak += 1
            }
            
            longest = max(longest, currentStreak)
        }
    }
    
    return longest
}
