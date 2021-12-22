import Foundation

struct Task2 {
    
    // MARK: Paths
    private let path1 = "diskr1.txt"
    private let path2 = "diskr2.txt"
    
    // MARK: Start Task Mathods
    func startTask1() {
        var count = 0
        task1(count: &count, startPoint: 1, k: 0, prefix: "")
        print(count)
    }
    func startTask2() {
        var count = 0
        task2(count: &count, startPoint: 1, k: 0, prefix: "", used: "")
        print(count)
    }
    
    // MARK: Task 2.1
    //  C(2,5) * 5 * 5 * 5 = 1250
    private func task1(count: inout Int, startPoint start: Int, k: Int, prefix: String) {
        if start == 5 {
            if k == 1 {
                writeToURL(text: prefix + "a" + "\n", fileName: path1)
                count += 1
            } else {
                ["b","c","d","e","f"].forEach { ch in
                    writeToURL(text: prefix + ch + "\n", fileName: path1)
                    count += 1
                }
            }
        } else if start == 4 && k == 0 {
            let value = prefix + "a"
            let newI = start + 1
            task1(count: &count, startPoint: newI, k: 1, prefix: value)
        } else {
            ["a","b","c","d","e","f"].forEach { ch in
                if !(k == 2 && ch == "a") {
                    let value = prefix + ch
                    let newI = start + 1
                    let newK = k + (ch == "a" ? 1 : 0)
                    task1(count: &count, startPoint: newI, k: newK, prefix: value)
                }
            }
        }
    }
    
    // MARK: Task 2.2
    //  C(2,5) * C(5,1) * C(4,1) * C(3,1) = 600
    private func task2(count: inout Int, startPoint start: Int, k: Int, prefix: String, used: String) {
        if start == 5 {
            if k == 1 {
                writeToURL(text: prefix + "a" + "\n", fileName: path2)
                count += 1
            } else {
                ["b","c","d","e","f"].forEach { ch in
                    if !used.contains(ch) {
                        writeToURL(text: prefix + ch + "\n", fileName: path2)
                        count += 1
                    }
                }
            }
        } else if start == 4 && k == 0 {
            let newI = start + 1
            let newPref = prefix + "a"
            
            task2(count: &count, startPoint: newI,
                  k: 1, prefix: newPref, used: used)
        } else {
            ["a","b","c","d","e","f"].forEach { ch in
                if !used.contains(ch) {
                    if !(k == 2 && ch == "a") {
                        let newI = start + 1
                        let newK = k + (ch == "a" ? 1 : 0)
                        let newUsed = ch == "a" ? used : used + ch
                        
                        task2(count: &count, startPoint: newI,
                              k: newK, prefix: prefix + ch, used: newUsed)
                    }
                }
            }
        }
    }
}
