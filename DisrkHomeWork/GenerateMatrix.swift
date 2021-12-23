import Foundation

func generateMatrix(of: String) -> String {
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
