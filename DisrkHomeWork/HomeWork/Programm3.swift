import Foundation

struct Task3 {
    
    // MARK: Paths
    private let path1 = "diskr1.txt"
    private let path2 = "diskr2.txt"
    
    // MARK: Alphabet
    private var alphabet = ["a","b","c","d","e","f"]
    
    // MARK: Start Task Methods
    func startTask1() {
        var count = 0
        
        task1(count: &count, i: 1, k: 1, prefix: "")
        print(count)
    }
    
    func startTask2() {
        var count = 0
        
        task2(count: &count, i: 1, prefix: "", repeats: [])
        print(count)
    }
    
    // MARK: Task 3.1
    //C(6,1) * C(5,2) * C(5,1) * C(4,1) * C(3,1) = 3600
    private func task1(count: inout Int, i: Int, k: Int, prefix: String) {
        if i == 5 {
            if k == 1 {
                prefix.forEach { ch in
                    writeToURL(text: prefix + String(ch) + "\n", fileName: path1)
                    count += 1
                }
            } else {
                alphabet.forEach { ch in
                    if !prefix.contains(ch) {
                        writeToURL(text: prefix + ch + "\n", fileName: path1)
                        count += 1
                    }
                }
            }
        } else {
            alphabet.forEach { ch in
                if k == 2 && !prefix.contains(ch) {
                    let newI = i + 1
                    let newPref = prefix + ch
                    
                    task1(count: &count, i: newI, k: k, prefix: newPref)
                } else if k == 1 {
                    let newI = i + 1
                    let newK = k + (prefix.contains(ch) ? 1 : 0)
                    let newPref = prefix + ch
                    
                    task1(count: &count, i: newI, k: newK, prefix: newPref)
                }
            }
        }
    }

    // MARK: Task 3.2
    //C(6,2) * C(6,2) * C(4,2) * C(4,2) * 2 = 16200
    private func task2(count: inout Int, i: Int, prefix: String, repeats: [String]) {
        if i == 6 {
            if repeats.count == 1 {
                alphabet.forEach { char in
                    if(prefix.contains(char) && !repeats.contains(char)) {
                        writeToURL(text: prefix + String(char) + "\n", fileName: path2)
                        count += 1
                    }
                }
            } else {
                alphabet.forEach { char in
                    if !prefix.contains(char) {
                        writeToURL(text: prefix + char + "\n", fileName: path2)
                        count += 1
                    }
                }
            }
        } else if i == 5 && repeats.count == 0 {
            prefix.forEach { char in
                if(!repeats.contains(String(char))) {
                    let newI = i + 1
                    task2(count: &count, i: newI, prefix: prefix + String(char), repeats: [String(char)])
                }
            }
        } else {
            alphabet.forEach { char in
                if !repeats.contains(char) {
                    if repeats.count < 2 || !prefix.contains(char) {
                        let newI = i + 1
                        let newPref = prefix + char
                        let newRepeats = prefix.contains(char) ? repeats.appending(char) : repeats
                        
                        task2(count: &count, i: newI, prefix: newPref, repeats: newRepeats)
                    }
                }
            }
        }
    }
}
