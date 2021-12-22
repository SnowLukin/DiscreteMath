import Foundation

private var solutior3_1_file = OutputStream(url: Bundle.main.executableURL!.deletingLastPathComponent().appendingPathComponent("solution3_1.txt"), append: true)!
private var solutior3_2_file = OutputStream(url: Bundle.main.executableURL!.deletingLastPathComponent().appendingPathComponent("solution3_2.txt"), append: true)!

private var alphabet = ["a","b","c","d","e","f"]

//C(6,1) * C(5,2) * C(5,1) * C(4,1) * C(3,1) = 3600

private func problem3_1(i: Int, k: Int, prefix: String) {
    if i == 5 {
        if k == 1 {
            prefix.forEach { ch in
                solutior3_1_file.write(prefix + String(ch) + "\n")
                iter += 1
            }
        } else {
            alphabet.forEach { ch in
                if !prefix.contains(ch) {
                    solutior3_1_file.write(prefix + ch + "\n")
                    iter += 1
                }
            }
        }
    } else {
        alphabet.forEach { ch in
            if k == 2 && !prefix.contains(ch) {
                let newI = i + 1
                let newPref = prefix + ch
                problem3_1(i: newI, k: k, prefix: newPref)
            } else if k == 1 {
                let newI = i + 1
                let newK = k + (prefix.contains(ch) ? 1 : 0)
                let newPref = prefix + ch
                
                problem3_1(i: newI, k: newK, prefix: newPref)
            }
        }
    }
}

//C(6,2) * C(6,2) * C(4,2) * C(4,2) * 2 = 16200

private func problem3_2(i: Int, prefix: String, repeats: [String]) {
    if i == 6 {
        if repeats.count == 1 {
            alphabet.forEach { ch in
                if(prefix.contains(ch) && !repeats.contains(ch)) {
                    solutior3_1_file.write(prefix + String(ch) + "\n")
                    iter += 1
                }
            }
        } else {
            alphabet.forEach { ch in
                if !prefix.contains(ch) {
                    solutior3_1_file.write(prefix + ch + "\n")
                    iter += 1
                }
            }
        }
    } else if i == 5 && repeats.count == 0 {
        prefix.forEach { ch in
            if(!repeats.contains(String(ch))) {
                let newI = i + 1
                problem3_2(i: newI, prefix: prefix + String(ch), repeats: [String(ch)])
            }
        }
    } else {
        alphabet.forEach { ch in
            if !repeats.contains(ch) {
                if repeats.count < 2 || !prefix.contains(ch) {
                    let newI = i + 1
                    let newPref = prefix + ch
                    let newRepeats = prefix.contains(ch) ? repeats.appending(ch) : repeats
                    problem3_2(i: newI, prefix: newPref, repeats: newRepeats)
                }
            }
        }
    }
}

func Problem3() {
    print("Problem3:")
    
    solutior3_1_file.open()
    problem3_1(i: 1, k: 1, prefix: "")
    solutior3_2_file.close()
        
    print(iter)
    iter = 0
    
    solutior3_2_file.open()
    problem3_2(i: 1, prefix: "", repeats: [])
    solutior3_2_file.close()
        
    print(iter)
    iter = 0
}
