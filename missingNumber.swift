/*
 Given an array nums containing n distinct numbers in the range [0, n], return the only number in the range that is missing from the array.
 
 Constraints:
 n == nums.length
 1 <= n <= 104
 0 <= nums[i] <= n
 */

func missingNumber(_ nums: [Int]) -> Int {
    let orderedArray = nums.sorted()
    
    if orderedArray.first != 0 {
        return 0
    }
    
    for num in 0..<orderedArray.count - 1 {
        if (orderedArray[num] + 1) != orderedArray[num + 1] {
            return orderedArray[num] + 1
        }
    }
    
    return orderedArray.last! + 1
}

/*
 Time: O(n)
 Space: O(n)
 */

func missingNumber(_ nums: [Int]) -> Int {
    let n = nums.count
    let expectedSum = n * (n + 1) / 2
    let actualSum = nums.reduce(0, +)
    return expectedSum - actualSum
}
