import Foundation

struct Task1 {
    
    // MARK: Paths
    private let path1 = "diskr1.txt"
    private let path2 = "diskr2.txt"
    private let path3 = "diskr3.txt"
    private let path4 = "diskr4.txt"
    private let path5 = "diskr5.txt"
    private let path6 = "diskr6.txt"
    
    // MARK: Alphabet
    private let alphabet = ["a", "b", "c", "d", "e", "f"]
    
    // MARK: Start Tasks Methods
    func startTask1(k: Int) {
        var count = 0
        task1(count: &count, startPoint: 1, prefix: "", endPoint: k)
        print(count)
    }
    
    func startTask2() {
        var count = 0
        task2(count: &count, startPoint: 1, prefix: "")
        print(count)
    }
    
    func startTask3(k: Int) {
        var count = 0
        task3(count: &count, startPoint: 1, prefix: "", endPoint: k)
        print(count)
    }
    
    func startTask4() {
        var count = 0
        task4(count: &count, startPoint: 1, prefix: "")
        print(count)
    }
    
    func startTask5(k: Int) {
        var count = 0
        task5(count: &count, startPoint: 1, prefix: "", endPoint: k)
        print(count)
    }
    func startTask6() {
        var count = 0
        task6(count: &count, startPoint: 1, prefix: "")
        print(count)
    }
    
    //  MARK: Task 1.1
    //  n^k
    // Пример:
    //  (6^5) = 7776
    private func task1(count: inout Int, startPoint start: Int, prefix: String, endPoint end: Int) {
        if start == end {
            alphabet.forEach { char in
                count += 1
                writeToURL(text: prefix + char + "\n", fileName: path1)
            }
        } else {
            alphabet.forEach { char in
                let newI = start + 1
                let newPref = prefix + char
                task1(count: &count, startPoint: newI, prefix: newPref, endPoint: end)
            }
        }
    }

    //  MARK: Task 1.2
    // n! (6!) = 720
    private func task2(count: inout Int, startPoint start: Int, prefix: String) {
        if start == alphabet.count {
            alphabet.forEach { char in
                if !prefix.contains(char) {
                    count += 1
                    writeToURL(text: prefix + char + "\n", fileName: path2)
                }
            }
        } else {
            alphabet.forEach { char in
                if !prefix.contains(char) {
                    let newI = start + 1
                    let newPref = prefix + char
                    task2(count: &count, startPoint: newI, prefix: newPref)
                }
            }
        }
    }

    //  MARK: Task 1.3
    // 1 * 2 * 3 * ... * k
    private func task3(count: inout Int, startPoint start: Int, prefix: String, endPoint end: Int) {
        if start == end {
            alphabet.forEach { char in
                if !prefix.contains(char) {
                    count += 1
                    writeToURL(text: prefix + char + "\n", fileName: path3)
                }
            }
        } else {
            alphabet.forEach { char in
                if !prefix.contains(char) {
                    let newI = start + 1
                    let newPref = prefix + char
                    task3(count: &count, startPoint: newI, prefix: newPref, endPoint: end)
                }
            }
        }
    }

    //  MARK: Task 1.4
    //  2^n
    //  (n == 6) == 1024
    private func task4(count: inout Int, startPoint start: Int, prefix: String) {
        let newI = start + 1
        if start == alphabet.count + 1 {
            count += 1
            writeToURL(text: prefix + "\n", fileName: path4)
        } else {
            alphabet.forEach { char in
                var isNormal = true
                prefix.forEach { char2 in
                    if alphabet.firstIndex(of: String(char2))! > alphabet.firstIndex(of: char)! {
                        isNormal = false
                    }
                }
                if !prefix.contains(char) && isNormal {
                    let newPref = prefix + char
                    count += 1
                    writeToURL(text: newPref + "\n", fileName: path1)
                    task4(count: &count, startPoint: newI, prefix: newPref)
                }
            }
        }
    }

    //  MARK: Task 1.5
    //  C(n,k) = C(6,4) = 15
    private func task5(count: inout Int, startPoint start: Int, prefix: String, endPoint end: Int) {
        let newI = start + 1
        if start == end + 1 {
            count += 1
            writeToURL(text: prefix + "\n", fileName: path5)
        } else {
            alphabet.forEach { char in
                var isNormal = true
                prefix.forEach { char2 in
                    if alphabet.firstIndex(of: String(char2))! > alphabet.firstIndex(of: char)! {
                        isNormal = false
                    }
                }
                if !prefix.contains(char) && isNormal {
                    let newPref = prefix + char
                    task5(count: &count, startPoint: newI, prefix: newPref, endPoint: end)
                }
            }
        }
    }

    //  MARK: Task 1.6
    //  ~C(n,n) -> ~C(6,6) = 462
    private func task6(count: inout Int, startPoint start: Int, prefix: String) {
        let newI = start + 1
        if start == alphabet.count + 1 {
            count += 1
            writeToURL(text: prefix + "\n", fileName: path6)
        } else {
            alphabet.forEach { char in
                var isNormal = true
                prefix.forEach { char2 in
                    if alphabet.firstIndex(of: String(char2))! > alphabet.firstIndex(of: char)! {
                        isNormal = false
                    }
                }
                if isNormal {
                    let newPref = prefix + char
                    task6(count: &count, startPoint: newI, prefix: newPref)
                }
            }
        }
    }
}
