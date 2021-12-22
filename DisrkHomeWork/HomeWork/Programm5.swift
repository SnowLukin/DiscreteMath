import Foundation

struct Task5 {
    
    // MARK: Paths
    private let path1 = "diskr1.txt"
    private let path2 = "diskr2.txt"
    
    // MARK: Alphabet
    private var alphabet = ["a","b","c","d","e","f"]
    
    // MARK: Start Task Methods
    func startTask1() {
        var count = 0
        task1(count: &count, i: 1, prefix: "", k: 0)
        print(count)
    }
    
    func startTask2() {
        var count = 0
        task2(count: &count, i: 1, prefix: "", k: 0)
        print(count)
    }
    
    // MARK: Task 5.1
    // 3 a: C(4,3) * 5 = 20
    // 4 a: 1
    // result: 21
    private func task1(count: inout Int, i: Int, prefix: String, k: Int) {
        let newI = i + 1

        if i == 4 {
            if k == 2 {
                writeToURL(text: prefix + "a" + "\n", fileName: path1)
                count += 1
            } else {
                alphabet.forEach { char in
                    writeToURL(text: prefix + char + "\n", fileName: path1)
                    count += 1
                }
            }
        } else if i == 3 && k == 1 {
            let newPref = prefix + "a"
            task1(count: &count, i: newI, prefix: newPref, k: 2)
        } else if i == 2 && k == 0 {
            let newPref = prefix + "a"
            task1(count: &count, i: newI, prefix: newPref, k: 1)
        } else {
            alphabet.forEach { char in
                let newPref = prefix + char
                let newK = k + (char == "a" ? 1 : 0)
                task1(count: &count, i: newI, prefix: newPref, k: newK)
            }
        }
    }
    
    // 3 a: C(7,3) * 5 * 5 * 5 * 5 = 21875
    // 4 a: C(7,4) * 5 * 5 * 5 = 4375
    // 5 a: C(7,5) * 5 * 5 = 525
    // 6 a: C(7,6) * 5 = 35
    // 7 a: 1
    // result = 26811
    private func task2(count: inout Int, i: Int, prefix: String, k: Int) {
        let newI = i + 1
        
        if i == 7 {
            if k == 2 {
                writeToURL(text: prefix + "a" + "\n", fileName: path2)
                count += 1
            } else {
                alphabet.forEach { char in
                    writeToURL(text: prefix + char + "\n", fileName: path2)
                    count += 1
                }
            }
        } else if i == 6 && k == 1 {
            let newPref = prefix + "a"
            task2(count: &count, i: newI, prefix: newPref, k: 2)
        } else if i == 5 && k == 0 {
            let newPref = prefix + "a"
            task2(count: &count, i: newI, prefix: newPref, k: 1)
        } else {
            alphabet.forEach { char in
                let newPref = prefix + char
                let newK = k + (char == "a" ? 1 : 0)
                task2(count: &count, i: newI, prefix: newPref, k: newK)
            }
        }
    }
}
