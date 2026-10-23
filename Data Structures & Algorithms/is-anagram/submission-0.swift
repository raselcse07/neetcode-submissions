class Solution {
    func isAnagram(_ s: String, _ t: String) -> Bool {
        guard s.count == t.count else {
            return false
        }

        var count = Array(repeating: 0, count: 26)
        let arrayS = Array(s)
        let arrayT = Array(t)

        for i in 0..<s.count {
            count[Int(arrayS[i].asciiValue!) - 97] += 1
            count[Int(arrayT[i].asciiValue!) - 97] -= 1
        }

        for val in count {
            if val != 0 {
                return false
            }
        }

        return true
    }
}
