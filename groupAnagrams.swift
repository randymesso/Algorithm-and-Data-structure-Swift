
/*
 Given an array of strings strs, group the anagrams together. You can return the answer in any order.

  

 Example 1:

 Input: strs = ["eat","tea","tan","ate","nat","bat"]

 Output: [["bat"],["nat","tan"],["ate","eat","tea"]]

 Explanation:

 There is no string in strs that can be rearranged to form "bat".
 The strings "nat" and "tan" are anagrams as they can be rearranged to form each other.
 The strings "ate", "eat", and "tea" are anagrams as they can be rearranged to form each other.
 Example 2:

 Input: strs = [""]

 Output: [[""]]

 Example 3:

 Input: strs = ["a"]

 Output: [["a"]]
 
 Step-by-step solution approach:
 To group anagrams, we need a common signature for each word.
 Example: "eat", "tea", "ate" → signature "aet".
 Or use a frequency array (count of each letter).
 Use a dictionary where:
 Key = signature
 Value = list of words that match that signature
 At the end, return all the dictionary’s values.
 
 
 */

func groupAnagrams(_ strs: [String]) -> [[String]] {
    var dict = [String: [String]]()
    
    for word in strs {
        // Key: sorted characters of the word
        let key = String(word.sorted())
        dict[key, default: []].append(word)
    }
    
    return Array(dict.values)
}
