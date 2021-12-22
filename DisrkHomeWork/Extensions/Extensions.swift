//
//  Extensions.swift
//  DisrkHomeWork
//
//  Created by Snow Lukin on 22.12.2021.
//

import Foundation

extension Array {
    func appending(_ value: Element) -> Array {
        var newArray = self
        newArray.append(value)
        return newArray
    }
}

extension String {
    subscript(i: Int) -> String {
        return String(self[self.index(startIndex, offsetBy: i)..<self.index(startIndex, offsetBy: i + 1)])
    }
    
    subscript(r: Range<Int>) -> String {
        return String(self[self.index(startIndex, offsetBy: r.startIndex)..<self.index(startIndex, offsetBy: r.endIndex)])
    }
}
