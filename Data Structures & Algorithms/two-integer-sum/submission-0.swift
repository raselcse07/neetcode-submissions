class Solution {
    func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
        var hashMap: [Int: Int] = [:]

        for (i, n) in nums.enumerated() {
            let diff = target - n
            if let index = hashMap[diff] {
                return [index, i]
            }
            hashMap[n] = i
        }

        return []
    }
}
