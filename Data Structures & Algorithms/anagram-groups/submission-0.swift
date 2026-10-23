class Solution {
    func groupAnagrams(_ strs: [String]) -> [[String]] {
        var hashMap = [Array<Int> : [String]]()

        for str in strs {
            var count = Array(repeating: 0, count: 26)

            for char in str {
                count[Int(char.asciiValue!) - 97] += 1
            }

            hashMap[count, default: []].append(str)
        }
        
        return Array(hashMap.values)
    }
}
