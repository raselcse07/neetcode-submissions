class Solution {
    func hasDuplicate(_ nums: [Int]) -> Bool {
        var frequency : [Int: Int] = [:]
        for i in nums {
            if let count = frequency[i], count > 1 {
                return true
            }
            frequency[i, default: 1] += 1
        }
        return false
    }
}
