import Foundation

struct IZTask91 {
    
    var k: Int
    var n: Int
    
    
    // 9.1.1. Дано множество A = { a, b, c, d, e, f, g, h, j }.
    // Сколько существует способов разбить его на 4 неименованных множеств?
    func startTask1() {
        var m = 0
        print("S(\(k),\(n))")
        print(task1(k: k, n: n, m: &m))
    }
    
    // 9.1.2. Дано множество A = { a, b, c, d, e, f, g, h, j }.
    // Сколько существует способов разбить его на 4 именованных множеств?
    func startTask2() {
        print("\(n)^\(k)")
        print(task2(k: k, n: n))
    }
    
    // 9.1.3. Дано множество A = { a, a, a, a, a, a, a, a, a }.
    // Сколько существует способов разбить его на 4 неименованных множеств?
    func startTask3() {
        print(task3(k: k, n: n))
    }
    
    // 9.1.4. Дано множество A = { a, a, a, a, a, a, a, a, a }.
    // Сколько существует способов разбить его на 4 именованных множеств?
    func startTask4() {
        print(task4(k: k, n: n))
    }
    
    // 9.1.5. Построить все подстановки на множестве цифр 1...9,
    // содержащих 4 независимых цикла.
    func startTask5() {
        print(task5(k: k, n: n))
    }
}

// MARK: - Extensions
extension IZTask91 {
    
    // MARK: Task 9.1.1
    private func task1(k: Int, n: Int, m: inout Int) -> Int {
        m += 1
        
        switch k {
        case 1:
            print("S(\(k), \(n)) = 1")
            return 1
        case n:
            print("S(\(k), \(n)) = 1")
            return 1
        case _ where n < k:
            print("S(\(k), \(n)) = 0")
            return 0
        default:
            return task1(k: k - 1, n: n - 1, m: &m) + k * task1(k: k, n: n - 1, m: &m)
        }
    }
    
    // MARK: Task 9.1.2
    private func task2(k: Int, n: Int) -> Decimal {
        pow(Decimal(n), k)
    }
    
    // MARK: Task 9.1.3
    private func task3(k: Int, n: Int) -> Int {
        var sum = 0
        for index in 1...k {
            sum += subTask3(k: index, n: n)
        }
        return sum
    }
    
    private func subTask3(k: Int, n: Int) -> Int {
        switch k {
        case n:
            return 1
        case 1:
            return 1
        case 2:
            return n / 2
        case _ where n < k:
            return 0
        default:
            return task3(k: k, n: n-k)
        }
    }
    
    // MARK: Task 9.1.4
    private func task4(k: Int, n: Int) -> Int {
        let temp = n / k
        var sum = 0
        var subSum = 0
        
        for _ in 1...n {
            sum += 1
            if subSum % temp == 0 {
                subSum += 1
            }
        }
        print(sum + subSum)
        print(temp - 1)
        return comb(sum + subSum - 1, temp - 1)
    }
    
    // MARK: Task 9.1.5
    private func task5(k: Int, n: Int) -> Int {
        switch k {
        case 0 where n == 0:
            return 1
        case 0:
            return 0
        case _ where n == 0:
            return 0
        default:
            return task5(k: k - 1, n: n - 1) + (n - 1) * task5(k: k, n: n - 1)
        }
    }
}





// MARK: Comb Objects
extension IZTask91 {
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
