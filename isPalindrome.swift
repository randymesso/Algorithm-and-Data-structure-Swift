
/*
 Given an integer x, return true if x is a palindrome, and false otherwise.

  

 Example 1:

 Input: x = 121
 Output: true
 Explanation: 121 reads as 121 from left to right and from right to left.
 Example 2:

 Input: x = -121
 Output: false
 Explanation: From left to right, it reads -121. From right to left, it becomes 121-. Therefore it is not a palindrome.
 Example 3:

 Input: x = 10
 Output: false
 Explanation: Reads 01 from right to left. Therefore it is not a palindrome.
 */

func isPalindrome(_ x: Int) -> Bool {
    // Negative numbers and numbers ending in 0 (except 0 itself) are not palindromes
    if x < 0 || (x % 10 == 0 && x != 0) {
        return false
    }

    var original = x
    var reversedHalf = 0

    // Reverse only the last half of the digits
    while original > reversedHalf {
        reversedHalf = reversedHalf * 10 + original % 10
        original /= 10
    }

    // For even length: original == reversedHalf
    // For odd length: original == reversedHalf / 10 (middle digit ignored)
    return original == reversedHalf || original == reversedHalf / 10
}
