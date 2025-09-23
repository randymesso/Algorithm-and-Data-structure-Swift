/*
 Given a string s and a dictionary of strings wordDict, return true if s can be segmented into a space-separated sequence of one or more dictionary words.

 Note that the same word in the dictionary may be reused multiple times in the segmentation.

  

 Example 1:

 Input: s = "leetcode", wordDict = ["leet","code"]
 Output: true
 Explanation: Return true because "leetcode" can be segmented as "leet code".
 Example 2:

 Input: s = "applepenapple", wordDict = ["apple","pen"]
 Output: true
 Explanation: Return true because "applepenapple" can be segmented as "apple pen apple".
 Note that you are allowed to reuse a dictionary word.
 Example 3:

 Input: s = "catsandog", wordDict = ["cats","dog","sand","and","cat"]
 Output: false

 */

func wordBreak(_ s: String, _ wordDict: [String]) -> Bool {
    let wordSet = Set(wordDict) // faster lookups than array
    let n = s.count
    var dp = Array(repeating: false, count: n + 1)
    dp[0] = true  // empty string is always valid
    
    let chars = Array(s)
    
    for i in 1...n {
        for j in 0..<i {
            let substring = String(chars[j..<i])
            if dp[j] && wordSet.contains(substring) {
                dp[i] = true
                break
            }
        }
    }
    
    return dp[n]
}
