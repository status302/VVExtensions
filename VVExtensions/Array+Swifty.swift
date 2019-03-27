//
//  Array.swift
//  Swifty
//
//  Created by vsccw on 2018/4/27.
//  Copyright © 2018年 vsccw. All rights reserved.
//

import Foundation

public extension Array {
  mutating func removeFirstSafely() -> Element? {
    guard first != nil else { return nil }
    return removeFirst()
  }

  mutating func removeLastSafely() -> Element? {
    guard last != nil else { return nil }
    return removeLast()
  }

  mutating func insertSafely(_ newElement: Element, at index: Int) {
    let index = Swift.min(index, count)
    insert(newElement, at: index)
  }

  func at(_ index: Int) -> Element? {
    guard count > index else { return nil }
    return self[index]
  }

  func last(_ count: Int) -> ArraySlice<Element> {
    guard self.count > count else { return self[0 ... self.count - 1] }
    return self[self.count - count ... self.count - 1]
  }

  func first(_ count: Int) -> ArraySlice<Element> {
    guard self.count > count else { return self[0 ... self.count - 1] }
    return self[0 ... count - 1]
  }

  var second: Element? {
    return at(1)
  }

  var third: Element? {
    return at(2)
  }

  var fourth: Element? {
    return at(3)
  }

  var fifth: Element? {
    return at(4)
  }

  var sixth: Element? {
    return at(5)
  }

  var seventh: Element? {
    return at(6)
  }

  var eighth: Element? {
    return at(7)
  }

  var nineth: Element? {
    return at(8)
  }

  var tenth: Element? {
    return at(9)
  }

  var eleventh: Element? {
    return at(10)
  }

  var twelfth: Element? {
    return at(11)
  }
}

public extension Array where Element: Equatable {
  func isEqual(to array: [Element]) -> Bool {
    guard count == array.count else { return false }
    for i in 0 ..< count {
      if at(i) != array.at(i) {
        return false
      }
    }
    return true
  }
}

public extension Array {
  func groups(byCount count: Int) -> [[Element]] {
    guard self.count > count else { return [self] }
    let groupCount = (self.count % count > 0) ? self.count / count + 1 : self.count / count
    var newArray: [[Element]] = []
    for i in 0 ..< groupCount {
      let max = Swift.min(self.count, (i + 1) * count)
      let temp = self[i * count ..< max]
      newArray.append(Array(temp))
    }
    return newArray

  }
}

public extension Array where Element: SignedInteger {

  var sum: Element {
    return reduce(0, +)
  }

  var product: Element {
    return reduce(1, *)
  }

  var average: Element {
    guard count > 0 else { return 0 }
    return sum / Element(count)
  }

  var min: Element? {
    return self.min()
  }
  var max: Element? {
    return self.max()
  }
}

public extension Array where Element: CustomStringConvertible {
  var string: String {
    return reduce("", { $0 + $1.description })
  }
}

public extension Array {
  var random: Element? {
    guard count > 0 else { return nil }
    let index = Int(arc4random_uniform(UInt32(count)))
    return at(index)
  }
}
