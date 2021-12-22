import Foundation


struct Task6 {
    
    // MARK: Paths
    private let path1 = "diskr1.txt"
    private let path2 = "diskr2.txt"
    
    // MARK: Alphabets
    private var alphabet = ["a","b","c","d","e","f"]
    
    func startTask6() {
        var count = 0
        task1(count: &count, i: 1, prefix: "", k: 0)
        print(count)
    }
    
    // MARK: Task 6
    // 4111: C(6,1) * C(7,4) * C(5,3) * 3 * 2 * 1 = 12600
    // 3211: C(6,1) * C(7,3) * C(5,1) * C(4,2) * C(4,2) * 2 = 75600
    // 2221: C(6,3) * C(7,2) * C(5,2) * C(3,2) * C(3,1) = 37800
    // result = 126000
    private func task1(count: inout Int, i: Int, prefix: String, k: Int) {
        let newI = i + 1
        
        if i == 7 {
            if k == 3 {
                alphabet.forEach { char in
                    if !prefix.contains(char) {
                        count += 1
                        writeToURL(text: prefix + char + "\n", fileName: path1)
                    }
                }
            } else {
                alphabet.forEach { char in
                    if prefix.contains(char) {
                        count += 1
                        writeToURL(text: prefix + char + "\n", fileName: path1)
                    }
                }
            }
        } else if (4...6).contains(i) && i - k == 4 {
            alphabet.forEach { char in
                if !prefix.contains(char) {
                    let newPref = prefix + char
                    let newK = k + 1
                    task1(count: &count, i: newI, prefix: newPref, k: newK)
                }
            }
        } else {
            alphabet.forEach { char in
                if k < 4 || prefix.contains(char) {
                    let newPref = prefix + char
                    let newK = k + (prefix.contains(char) ? 0 : 1)
                    task1(count: &count, i: newI, prefix: newPref, k: newK)
                }
            }
        }
    }
}
