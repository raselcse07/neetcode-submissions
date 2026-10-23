class Solution {
    func isPalindrome(_ s: String) -> Bool {
        let chars = Array(s)
        var left = 0
        var right = chars.count - 1

        while left < right {
            while left < right && !isValidChar(chars[left]) {
                left += 1
            }

            while right > left && !isValidChar(chars[right]) {
                right -= 1
            }

            if chars[left].lowercased() != chars[right].lowercased() {
                return false
            }

            left += 1
            right -= 1
        }

        return true
    }

    func isValidChar(_ c: Character) -> Bool {
        c.isLetter || c.isNumber
    }
}
