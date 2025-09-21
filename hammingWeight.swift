/*
 Given a positive integer n, write a function that returns the number of set bits in its binary representation (also known as the Hamming weight).

  

 Example 1:

 Input: n = 11

 Output: 3

 Explanation:

 The input binary string 1011 has a total of three set bits.

 Example 2:

 Input: n = 128

 Output: 1

 Explanation:

 The input binary string 10000000 has a total of one set bit.

n = 2^x
 
 2^0
 */

func hammingWeight(_ n: Int) -> Int {
    var x = n
    var count = 0
    
    while x > 0 {
        x = x & (x - 1)   // removes the lowest set bit
        count += 1
    }
    
    return count
}
