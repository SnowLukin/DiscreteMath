import Foundation

struct Task7 {
    
    private let path1 = "diskr1.txt"
    private let path2 = "diskr2.txt"
    
    private var p = 5
    private var q = 5
    private var edgeCount = 10
    
    // MARK: Start Task Methods
    func startTask1() {
        var count = 0
        task1(count: &count, i: 1,k: 0,prefix: "")
        print(count)
    }
    
    func startTask2() {
        var count = 0
        task2(count: &count, i: 1, prefix: "")
        print(count)
    }
    
    // MARK: Task 7.1
    //C(C(p,2),q) = C(C(5,2),5) = C(10,5) = 2 * 7 * 2 * 9 = 63 * 4 = 252
    private func task1(count: inout Int, i: Int, k: Int, prefix: String) {
        let newI = i + 1
        let newK = k + 1
        if i == edgeCount + 1 {
            count += 1
            writeToURL(text: generateMatrix(of: prefix + prefix) + "\n", fileName: path1)
        } else if (edgeCount - i + 1) - (q - k) == 0 {
            let newPref = prefix + "1"
            task1(count: &count, i: newI, k: newK, prefix: newPref)
        } else {
            if k < 5 {
                let newPref = prefix + "1"
                task1(count: &count, i: newI, k: newK, prefix: newPref)
            }
            let newPref = prefix + "0"
            task1(count: &count, i: newI, k: k, prefix: newPref)
        }
    }
    
    // MARK: Task 7.2
    // 1024
    private func task2(count: inout Int, i: Int, prefix: String) {
        let newI = i + 1
        if i == edgeCount + 1 {
            count += 1
            writeToURL(text: generateMatrix(of: prefix + prefix) + "\n", fileName: path2)
        } else {
            let pref1 = prefix + "0"
            let pref2 = prefix + "1"
            task2(count: &count, i: newI, prefix: pref1)
            task2(count: &count, i: newI, prefix: pref2)
        }
    }
    
    private func generateMatrix(of: String) -> String {
        var offset: Int = 0
        var result = ""
        let size = Int(ceil(sqrt(Double(of.count))))
        for i in 0..<size {
            for j in 0..<i {
                result += of[of.index(of.startIndex, offsetBy: (size - 1) * (j) - (j * (j + 1)) / 2 + i - 1 + 10)..<of.index(of.startIndex, offsetBy: (size - 1) * (j) - (j * (j + 1)) / 2 + i + 10)] + " "
            }
            result += "0 "
            
            for j in i + 1..<size {
                result += "\(of[of.index(of.startIndex, offsetBy: j - i - 1 + offset)..<of.index(of.startIndex, offsetBy: j - i - 1 + offset + 1)]) "
            }
            offset += size - i - 1
            result += "\n"
        }
        
        return result
    }
}
