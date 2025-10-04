/*
 Given an input string s and a pattern p, implement regular expression matching with support for '.' and '*' where:

 '.' Matches any single character.
 '*' Matches zero or more of the preceding element.
 The matching should cover the entire input string (not partial).

  

 Example 1:

 Input: s = "aa", p = "a"
 Output: false
 Explanation: "a" does not match the entire string "aa".
 Example 2:

 Input: s = "aa", p = "a*"
 Output: true
 Explanation: '*' means zero or more of the preceding element, 'a'. Therefore, by repeating 'a' once, it becomes "aa".
 Example 3:

 Input: s = "ab", p = ".*"
 Output: true
 Explanation: ".*" means "zero or more (*) of any character (.)".
 */

class Solution {
    func isMatch(_ s: String, _ p: String) -> Bool {
        let text = Array(s)
        let pattern = Array(p)
        let m = text.count
        let n = pattern.count

        // dp[i][j] = whether text[0..<i] matches pattern[0..<j]
        var dp = Array(repeating: Array(repeating: false, count: n + 1), count: m + 1)
        dp[0][0] = true

        // Initialize dp[0][j] — empty text vs pattern prefix.
        // A pattern like a*, a*b*, (x*)* etc can match empty string.
        if n >= 2 {
            for j in 2...n {
                if pattern[j - 1] == "*" {
                    dp[0][j] = dp[0][j - 2]
                }
            }
        }

        for i in 1...m {
            for j in 1...n {
                let pj = pattern[j - 1]
                if pj == "." || pj == text[i - 1] {
                    // current chars match -> depends on previous
                    dp[i][j] = dp[i - 1][j - 1]
                } else if pj == "*" {
                    // Two cases for '*':
                    // 1) Zero occurrences of the char before '*' -> drop "x*"
                    dp[i][j] = dp[i][j - 2]

                    // 2) One or more occurrences -> if preceding pattern char matches current text char,
                    //    we can "consume" one text char and remain at same pattern j.
                    let prevPatternChar = pattern[j - 2]
                    if prevPatternChar == "." || prevPatternChar == text[i - 1] {
                        dp[i][j] = dp[i][j] || dp[i - 1][j]
                    }
                } else {
                    dp[i][j] = false
                }
            }
        }

        return dp[m][n]
    }
}
