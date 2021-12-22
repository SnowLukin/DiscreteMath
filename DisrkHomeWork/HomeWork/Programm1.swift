import Foundation

struct Task1 {
    private let path1 = "diskr1.txt"
    private let path2 = "diskr2.txt"
    private let path3 = "diskr3.txt"
    private let path4 = "diskr4.txt"
    private let path5 = "diskr5.txt"
    private let path6 = "diskr6.txt"
    
    private let alphabet = ["a","b","c","d", "e", "f"]
    
    func Problem1() {
        print("Problem1:")
        problem1_1(i: 1, prefix: "", k: 5)
        print(iter)
        
        iter = 0
        problem1_2(i: 1, prefix: "")
        print(iter)
        
        iter = 0
        problem1_3(i: 1, prefix: "", k: 3)
        print(iter)
        
        iter = 0
        problem1_4(i: 1, prefix: "")
        print(iter)
        
        iter = 0
        problem1_5(i: 1, prefix: "", k: 4)
        print(iter)
        
        iter = 0
        problem1_6(i: 1, prefix: "")
        print(iter)
        iter = 0
    }
    
    //  MARK: - Задание 1.1
    //  n^k
    // Пример:
    //  (6^5) = 7776
    private func problem1_1(i: Int, prefix: String, k: Int) {
        if i == k {
            alphabet.forEach { char in
                iter += 1
                writeToURL(text: prefix + char + "\n", fileName: path1)
            }
        } else {
            alphabet.forEach { char in
                let newI = i + 1
                let newPref = prefix + char
                problem1_1(i: newI, prefix: newPref, k: k)
            }
        }
    }

    //  MARK: - Задание 1.2
    // n! (6!) = 720
    private func problem1_2(i: Int, prefix: String) {
        if i == alphabet.count {
            alphabet.forEach { char in
                if !prefix.contains(char) {
                    iter += 1
                    writeToURL(text: prefix + char + "\n", fileName: path2)
                }
            }
        } else {
            alphabet.forEach { char in
                if !prefix.contains(char) {
                    let newI = i + 1
                    let newPref = prefix + char
                    problem1_2(i: newI, prefix: newPref)
                }
            }
        }
    }

    //  MARK: - Задание 1.3
    // 1 * 2 * 3 * ... * k
    private func problem1_3(i: Int, prefix: String,k: Int) {
        if i == k {
            alphabet.forEach { char in
                if !prefix.contains(char) {
                    iter += 1
                    writeToURL(text: prefix + char + "\n", fileName: path3)
                }
            }
        } else {
            alphabet.forEach { char in
                if !prefix.contains(char) {
                    let newI = i + 1
                    let newPref = prefix + char
                    problem1_3(i: newI, prefix: newPref, k: k)
                }
            }
        }
    }

    //  MARK: - Задание 1.4
    //  2^n
    //  (n == 6) == 1024
    private func problem1_4(i: Int, prefix: String) {
        let newI = i + 1
        if i == alphabet.count + 1 {
            iter += 1
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
                    iter += 1
                    writeToURL(text: newPref + "\n", fileName: path1)
                    problem1_4(i: newI, prefix: newPref)
                }
            }
        }
    }

    //  MARK: - Задание 1.5
    //  C(n,k) = C(6,4) = 15
    private func problem1_5(i: Int, prefix: String, k: Int) {
        let newI = i + 1
        if i == k + 1 {
            iter += 1
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
                    problem1_5(i: newI, prefix: newPref, k: k)
                }
            }
        }
    }

    //  MARK: - Задание 1.6
    //  ~C(n,n) -> ~C(6,6) = 462
    private func problem1_6(i: Int, prefix: String) {
        let newI = i + 1
        if i == alphabet.count + 1 {
            iter += 1
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
                    problem1_6(i: newI, prefix: newPref)
                }
            }
        }
    }
}
