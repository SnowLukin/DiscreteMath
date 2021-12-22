import Foundation

struct Task2 {
    private let path1 = "diskr1.txt"
    private let path2 = "diskr2.txt"
    
    
    func Problem2() {
        print("Problem2:")

        problem2_1(i: 1, k: 0, prefix: "")
        print(iter)
        iter = 0
        
        
        problem2_2(i: 1, k: 0, prefix: "", used: "")
        print(iter)
        iter = 0
    }
    
    // MARK: Problem 2_1
    //  C(2,5) * 5 * 5 * 5 = 1250
    private func problem2_1(i: Int, k: Int, prefix: String) {
        if i == 5 {
            if k == 1 {
                writeToURL(text: prefix + "a" + "\n", fileName: path1)
                iter += 1
            } else {
                ["b","c","d","e","f"].forEach { ch in
                    writeToURL(text: prefix + ch + "\n", fileName: path1)
                    iter += 1
                }
            }
        } else if i == 4 && k == 0 {
            let value = prefix + "a"
            let newI = i + 1
            problem2_1(i: newI, k: 1, prefix: value)
        } else {
            ["a","b","c","d","e","f"].forEach { ch in
                if !(k == 2 && ch == "a") {
                    let value = prefix + ch
                    let newI = i + 1
                    let newK = k + (ch == "a" ? 1 : 0)
                    problem2_1(i: newI, k: newK, prefix: value)
                }
            }
        }
    }

    //  C(2,5) * C(5,1) * C(4,1) * C(3,1) = 600
    private func problem2_2(i: Int, k: Int, prefix: String, used: String) {
        if i == 5 {
            if k == 1 {
                writeToURL(text: prefix + "a" + "\n", fileName: path2)
                iter += 1
            } else {
                ["b","c","d","e","f"].forEach { ch in
                    if !used.contains(ch) {
                        writeToURL(text: prefix + ch + "\n", fileName: path2)
                        iter += 1
                    }
                }
            }
        } else if i == 4 && k == 0 {
            let newI = i + 1
            let newPref = prefix + "a"
            
            problem2_2(i: newI, k: 1, prefix: newPref, used: used)
        } else {
            ["a","b","c","d","e","f"].forEach { ch in
                if !used.contains(ch) {
                    if !(k == 2 && ch == "a") {
                        let newI = i + 1
                        let newK = k + (ch == "a" ? 1 : 0)
                        let newUsed = ch == "a" ? used : used + ch
                        
                        problem2_2(i: newI, k: newK, prefix: prefix + ch, used: newUsed)
                    }
                }
            }
        }
    }
}
