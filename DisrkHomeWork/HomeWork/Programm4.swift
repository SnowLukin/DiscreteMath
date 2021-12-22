import Foundation

struct Task4 {
    
    // MARK: Paths
    private let path1 = "diskr1.txt"
    private let path2 = "diskr2.txt"
    
    // MARK: Alphabet
    private var alphabet = ["a","b","c","d","e","f"]
    
    // MARK: Start Task Methods
    func startTask1() {
        var count = 0
        task1(count: &count, i: 1, prefix: "", k1: ("",0), k2: ("",0))
        print(count)
    }
    func startTask2() {
        var count = 0
        task2(count: &count, i: 1, prefix: "", k1: ("",0), k2: ("",0), k3: ("",0))
        print(count)
    }
    
    // MARK: Task 4.1
    // C(6,1) * C(7,2) * C(5,1) * C(5,3) * C(4,2) * 2 = 75600
    private func task1(count: inout Int, i: Int, prefix: String, k1: (String, Int), k2: (String, Int)) {
        if i == 7 {
            if k1.1 == 3 && k2.1 == 1 {
                writeToURL(text: prefix + k2.0 + "\n", fileName: path1)
                count += 1
            } else if k1.1 == 2 && k2.1 == 2 {
                writeToURL(text: prefix + k1.0 + "\n", fileName: path1)
                count += 1
            } else {
                alphabet.forEach { char in
                    if char != k1.0 && char != k2.0 && !prefix.contains(char) {
                        writeToURL(text: prefix + char + "\n", fileName: path1)
                        count += 1
                    }
                }
            }
        } else if (3...6).contains(i) && i + (3 - k1.1 + 2 - k2.1) == 8 {
            task1(count: &count, i: i, prefix: prefix, k1: k1, k2: k2)
        }
        else {
            alphabet.forEach { char in
                if prefix.contains(char) {
                    if k1.1 > 0 && k1.1 < 3 && char == k1.0 {
                        let newI = i + 1
                        let newPref = prefix + char
                        let newK1 = (k1.0, k1.1 + 1)
                    
                        task1(count: &count, i: newI, prefix: newPref, k1: newK1, k2: k2)
                        
                    } else if k2.1 > 0 && k2.1 < 2 && char == k2.0 {
                        let newI = i + 1
                        let newPref = prefix + char
                        let newK2 = (k2.0, k2.1 + 1)
                        task1(count: &count, i: newI, prefix: newPref, k1: k1, k2: newK2)
                    }
                } else {
                    if k1.0 != char && k2.0 != char {
                        let newI = i + 1
                        task1(count: &count, i: newI, prefix: prefix + char, k1: k1, k2: k2)
                    }
                    if k1.1 == 0 {
                        let newI = i + 1
                        let newChar = (char, 1)
                        task1(count: &count, i: newI, prefix: prefix + char, k1: newChar, k2: k2)
                    }
                    if k2.1 == 0 {
                        let newI = i + 1
                        let newChar = (char, 1)
                        task1(count: &count, i: newI, prefix: prefix + char, k1: k1, k2: newChar)
                    }
                }
            }
        }
    }
    
    // MARK: Task 4.2
    //C(6,2) * C(9,2) * C(7,2) * C(4,1) * C(5,3) * C(3,2) * 2 = 2721600
    private func task2(count: inout Int, i: Int, prefix: String,
                       k1: (String, Int), k2: (String, Int), k3: (String, Int)) {
        let newI = i + 1

        //  delete repeted
        if k2.0 != "" && k3.0 != "" && alphabet.firstIndex(of: k2.0)! > alphabet.firstIndex(of: k3.0)! {
            return
        }
        
        if i == 9 {
            if k1.1 == 2 {
                writeToURL(text: prefix + k1.0 + "\n", fileName: path2)
                count += 1
            } else if k2.1 == 1 {
                writeToURL(text: prefix + k2.0 + "\n", fileName: path2)
                count += 1
            } else if k3.1 == 1 {
                writeToURL(text: prefix + k3.0 + "\n", fileName: path2)
                count += 1
            } else {
                alphabet.forEach { char in
                    if !prefix.contains(char) {
                        writeToURL(text: prefix + char + "\n", fileName: path2)
                        count += 1
                    }
                }
            }
        } else if (3...8).contains(i) && i + (3 - k1.1 + 2 - k2.1 + 2 - k3.1) == 10 {
            subTask2(count: &count, i: i, prefix: prefix, k1: k1, k2: k2, k3: k3)
        } else {
            alphabet.forEach { char in
                if prefix.contains(char) {
                    if k1.1 > 0 && k1.1 < 3 && char == k1.0 {
                        let newChar = (k1.0, k1.1 + 1)

                        task2(count: &count, i: newI, prefix: prefix + char, k1: newChar, k2: k2, k3: k3)
                    } else if k2.1 > 0 && k2.1 < 2 && char == k2.0 {
                        let newChar = (k2.0, k2.1 + 1)

                        task2(count: &count, i: newI, prefix: prefix + char, k1: k1, k2: newChar, k3: k3)
                    } else if k3.1 > 0 && k3.1 < 2 && char == k3.0 {
                        let newChar = (k3.0, k3.1 + 1)
                        task2(count: &count, i: newI, prefix: prefix + char, k1: k1, k2: k2, k3: newChar)
                    }
                } else {
                    if char != k1.0 && char != k2.0 && char != k3.0 {
                        task2(count: &count, i: newI, prefix: prefix + char, k1: k1, k2: k2, k3: k3)
                    }
                    
                    if k1.1 == 0 {
                        let newPref = prefix + char
                        let newChar = (char,1)
                        task2(count: &count, i: newI, prefix: newPref, k1: newChar, k2: k2, k3: k3)
                    }
                    if k2.1 == 0 {
                        let newPref = prefix + char
                        let newChar = (char,1)

                        task2(count: &count, i: newI, prefix: newPref, k1: k1, k2: newChar, k3: k3)
                    }
                    if k3.1 == 0 {
                        let newPref = prefix + char
                        let newChar = (char,1)

                        task2(count: &count, i: newI, prefix: newPref, k1: k1, k2: k2, k3: newChar)
                    }
                }
            }
        }
    }
    
    private func subTask2(count: inout Int, i: Int, prefix: String,
                          k1: (String, Int), k2: (String, Int), k3: (String, Int)) {
        if k1.1 == 0 {
            alphabet.forEach { char in
                if !prefix.contains(char) {
                    let newI = i + 1
                    let newPref = prefix + char
                    let newChar = (char,1)
                    task2(count: &count, i: newI, prefix: newPref, k1: newChar, k2: k2, k3: k3)
                }
            }
        } else if k1.1 == 1 || k1.1 == 2 {
            let newI = i + 1
            let newPref = prefix + k1.0
            let newChar = (k1.0, k1.1 + 1)
            task2(count: &count, i: newI, prefix: newPref, k1: newChar, k2: k2, k3: k3)
        }
        if k2.1 == 0 {
            alphabet.forEach { char in
                if !prefix.contains(char) {
                    let newI = i + 1
                    let newPref = prefix + char
                    let newChar = (char,1)
                    task2(count: &count, i: newI, prefix: newPref, k1: k1, k2: newChar, k3: k3)
                }
            }
        } else if k2.1 == 1 {
            let newI = i + 1
            let newPref = prefix + k2.0
            let newK2 = (k2.0, k2.1 + 1)
            task2(count: &count, i: newI, prefix: newPref, k1: k1, k2: newK2, k3: k3)
        }
        
        if k3.1 == 0 {
            alphabet.forEach { char in
                if !prefix.contains(char) {
                    let newI = i + 1
                    let newPref = prefix + char
                    let newChar = (char,1)
                    task2(count: &count, i: newI, prefix: newPref, k1: k1, k2: k2, k3: newChar)
                }
            }
        } else if k3.1 == 1 {
            let newI = i + 1
            let newPref = prefix + k3.0
            let char = (k2.0, k3.1 + 1)
            task2(count: &count, i: newI, prefix: newPref, k1: k1, k2: k2, k3: char)
        }
    }
}
