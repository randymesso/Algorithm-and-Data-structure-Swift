/*
 Given an integer array nums, find a subarray that has the largest product, and return the product.
 
 The test cases are generated so that the answer will fit in a 32-bit integer.
 
 
 
 Example 1:
 
 Input: nums = [2,3,-2,4]
 Output: 6
 Explanation: [2,3] has the largest product 6.
 Example 2:
 
 Input: nums = [-2,0,-1]
 Output: 0
 Explanation: The result cannot be 2, because [-2,-1] is not a subarray.
 
 Features:
 Time Complexity: O(n)
 Space Complexity: O(1)
 
 */


func maxProduct(_ nums: [Int]) -> Int {
    var result = nums[0]
    var currMax = nums[0]
    var currMin = nums[0]
    
    for i in 1..<nums.count {
        let num = nums[i]
        
        // If num is negative, swap currMax and currMin
        if num < 0 {
            (currMax, currMin) = (currMin, currMax)
        }
        
        currMax = max(num, currMax * num)
        currMin = min(num, currMin * num)
        
        result = max(result, currMax)
    }
    
    return result
}
