/*
 Problem 1: Unique Characters (Easy — Strings/Sets)
 Write a function that checks if a given string has all unique characters.

Feateres: 
Lookup (contains): O(1) average case
Insert: O(1) average case
Overall Time Complexity: O(n)
Space Complexity: O(min(n, alphabet size))
 */
func hasAllUniqueCharacters(_ s: String) -> Bool {
    var array = Set<Character>()
    
    for char in s {
        if array.contains(char) {
            return false
        }
        array.insert(char)
    }
    return true
}

