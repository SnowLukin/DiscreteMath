import Foundation

struct IZTask92 {
    
    var n: Int
    
    // 9.2.1. Сколько существует связных графов из 7 вершин?
    func startTask1() {
        print(task1(n: n))
    }
    
    // 9.2.2. Сколько существует эйлеровых графов из 7 вершин?
    func startTask2() {
        print(countE(n))
    }
    
    // 9.2.3. Сколько существует графов из 7 вершин,
    // которые можно раскрасить в 3 цветов?
    func startTask3() {
        var m = 0
        print(countC(n, 3, &m))
    }
    
    // 9.2.4. Сколько существует эйлеровых графов из 7 вершин и 11 ребер?
    func startTask4() {
        print(countU(7, 11))
    }
}

extension IZTask92 {
    
    // MARK: Task 9.2.1
    private func countG(n: Int) -> Int {
        Int(pow(2.0, Float((n * (n - 1)) / 2)))
    }
    
    private func getSum(n: Int) -> Int {
        var sum = 0
        for index in 1..<n {
            sum += index * comb(n, index) * task1(n: n) * countG(n: n - index)
        }
        return sum
    }
    
    private func task1(n: Int) -> Int {
        countG(n: n) - (1 / n) * getSum(n: n)
    }
    
    // MARK: Task 9.2.2
    private func countW(_ p: Int) -> Int {
        Int(pow(2.0, Double((p*(p-1)/2))))
    }
    
    private func wSum(_ p: Int) -> Int {
        var sum = 0
        for index in 1..<p {
            sum += comb(p, index) * countE(index) * countW(p - index)
        }
        return sum
    }
    
    private func countE(_ p: Int) -> Int {
        countW(p) - (1 / p) * wSum(p)
    }
    
    // MARK: Task 9.2.3
    private func sumTask3(_ p: Int, _ k: Int, _ m: inout Int) -> Int {
        var sum = 0
        
        for index in 1..<p {
            let temp = pow(2.0, Double( (index * (p - index) * countC(index, k - 1, &m) ) ) )
            sum += comb(p, index) * Int(pow(2.0, temp))
        }
        return sum
    }
    
    private func countC(_ p: Int, _ k: Int, _ m: inout Int) -> Int {
        m += 1
        
        switch k {
        case 1:
            return 1
        case _ where p < k:
            return 0
        default:
            return (1 / k) * sumTask3(p, k, &m)
        }
    }
    
    // MARK: Task 9.2.4
    private func sumTask4(_ p: Int, _ x: Int) -> Int {
        var sum = 0
        
        for index in 0...p {
            let temp = pow(Double((1 - x) / (1 + x)), Double(index * (p - index)))
            sum += comb(p, Int(temp))
        }
        return sum
    }
    
    private func countWTask4(_ p: Int, _ x: Int) -> Int {
        if p < 3 {
            return 1
        }
        return 1 / Int(pow(2.0, Double(p))) * Int(pow(Double(1 + x), Double(comb(p, 2) * sumTask4(p, x))))
    }
    
    private func getWW(_ p: Int, _ y: Int) -> Int {
        var sum = 0
        for index in 1...y {
            sum += countWTask4(index, p) * Int(pow(Double(y), Double(index))) / factorial(index)
        }
        return sum
    }
    
    private func countU(_ x: Int, _ y: Int) -> Int {
        let temp = Double(1 + countWTask4(x, y))
        return Int(log(temp))
    }
}

// MARK: Comb Objects
extension IZTask92 {
    private func factorial(_ number: Int) -> Int {
        if number == 0 {
            return 0
        }
        return factorial(number - 1) * number
    }

    private func comb(_ x: Int, _ y: Int) -> Int {
        factorial(x) / (factorial(y) * factorial(x - y))
    }
}
