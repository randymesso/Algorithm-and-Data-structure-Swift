/*
 Problem Statement
 You’re building an app that needs to fetch and display user information. Given an array of user dictionaries (like JSON), return the username of the user with the longest bio.
 If multiple users have bios of the same length, return the one that appears first in the list. If a user doesn’t have a bio, treat it as length 0.
 */

func userWithLongestBio(_ users: [[String: String?]]) -> String {
    var longestUser = ""
    var longestBio = ""
    
    for user in users {
        // safely unwrap the bio
        let bio = user["bio"] ?? nil
        if (bio?.count ?? 0) > longestBio.count {
            longestBio = bio ?? ""
            longestUser = (user["username"]!) ?? "unknown"
        }
    }
    return longestUser
}

//Examples
let users: [[String: String?]] = [
    ["username": "alice", "bio": "iOS developer, coffee lover ☕️"],
    ["username": "bob", "bio": "Loves cats 😺"],
    ["username": "carol", "bio": nil],
    ["username": "dave", "bio": "Senior engineer, mentor, enjoys hiking 🥾"]
]


userWithLongestBio(users)
