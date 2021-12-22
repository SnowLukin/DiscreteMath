import Foundation

struct Task8 {
    
    private var alphabet = ["0","1","2","3"]
    private var wasAutomorfizm: Bool = false
    
    private var matrix1: String = ""
    private var matrix2: String = ""
    private var n: Int = 0
    
    mutating func startTask1() {
        print("Введите размерность матрицы:")
        n = Int(readLine()!)!
        
        print("Введите первую матрицу:")
        for _ in 0..<n {
            matrix1 += readLine()!
        }
        
        print("Введите вторую матрицу:")
        for _ in 0..<n {
            matrix2 += readLine()!
        }
        
        alphabet = []
        for i in 0..<n {
            alphabet.append("\(i)")
        }
        
        task1(i: 1, prefix: "")
        
        print(wasAutomorfizm)
    }
    
    
    // MARK: Task 8
    private mutating func task1(i: Int, prefix: String) {
        if i == alphabet.count + 1 {
            if !wasAutomorfizm {
                var transMatrix = convertToArray(matrix: matrix2)
                
                for p in toTransArray(value: prefix) {
                    transMatrix = replace(matrix: transMatrix, from: p.1, to: p.0)
                }
                
                if convertToMatrix(m: transMatrix) == matrix1 {
                    wasAutomorfizm = true
                }
            }
        } else {
            alphabet.forEach { char in
                if !prefix.contains(char) {
                    let newI = i + 1
                    let newPref = prefix + char
                    task1(i: newI, prefix: newPref)
                }
            }
        }
    }
    
    private func convertToArray(matrix: String) -> [(Int, [Int])] {
        var result: [(Int,[Int])] = []
        let size = Int(sqrt(Double(matrix.count)))
        
        for i in 0..<size {
            result.append((i, []))
        }
        
        for i in 0..<size {
            for j in 0..<size where j != i && matrix[i * size + j] == "1" {
                if !result[i].1.contains(j) {
                    result[i].1.append(j)
                }
            }
        }
        
        //print(result)
        return result
    }
    
    private func convertToMatrix(m: [(Int, [Int])]) -> String {
        var result = ""
        let size = m.count

        for i in 0..<size {
            for j in 0..<size {
                result += m[i].1.contains(j) ? "1" : "0"
            }
        }
        
        return result
    }

    private func replace(matrix: [(Int, [Int])], from: Int, to: Int) -> [(Int,[Int])] {
        var result = matrix
        
        result[from].0 = to
        result[to].0 = from
        
        for j in 0..<result.count {
            for i in 0..<result[j].1.count {
                if result[j].1[i] == from {
                    result[j].1[i] = to
                } else if result[j].1[i] == to {
                    result[j].1[i] = from
                }
            }
        }

        result.sort(by: {(v1,v2) in v1.0 < v2.0})
        return result
    }

    private func printMatrix(matrix: String) {
        let size = Int(sqrt(Double(matrix.count)))

        for i in 0..<size {
            print(matrix[i * size..<i * size + size])
        }
        print()
    }
    
    private func toTransArray(value: String) -> [(Int, Int)] {
        var result: [(Int, Int)] = []
        
        for i in 0..<value.count {
            var subArray: [(Int, Int)] = []
            for j in i..<value.count where Int(value[j])! < Int(value[i])! {
                subArray.append((Int(value[i])!,Int(value[j])!))
            }
            
            subArray.sort(by: {(v1,v2) in v1.1 > v2.1})
            result.append(contentsOf: subArray)
        }
                
        return result
    }
}

// 1 2 3 4    3 2 1 4


// 0 1 1 1    0 0 1 0
// 1 0 0 0 -> 0 0 1 0
// 1 0 0 0    1 1 0 1
// 1 0 0 0    0 0 1 0

// 0 1 0 1    0 0 0 0
// 1 0 0 0 -> 0 0 1 0
// 0 0 0 0    0 1 0 1
// 1 0 0 0    0 0 1 0
