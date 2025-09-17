/*
 Write a function to determine if two strings are anagrams of each other.
 Input: "listen", "silent" → Output: true
 
 Features:
 Count each character in s (O(n)).
 Subtract each character in t (O(n)).
 Dictionary lookups and updates are O(1) average.
 Time complexity: O(n) (linear).
 Space complexity: O(k) where k = unique characters (at most 26 for English letters)
 */

func isAnagram(_ s: String, _ t: String) -> Bool {
    // Quick check: different lengths can't be anagrams
    if s.count != t.count {
        return false
    }
    
    var charCounts: [Character: Int] = [:]
    
    // Count characters in the first string
    for char in s {
        charCounts[char, default: 0] += 1
    }
    
    // Subtract counts using the second string
    for char in t {
        charCounts[char, default: 0] -= 1
        if charCounts[char]! < 0 {
            return false // More of a char in t than in s
        }
    }
    
    // If everything balances out, they’re anagrams
    return true
}
