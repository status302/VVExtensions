//
//  Array.swift
//  Swifty
//
//  Created by vsccw on 2018/4/27.
//  Copyright © 2018年 vsccw. All rights reserved.
//

import Foundation

public extension Array {
  public mutating func removeFirstSafely() -> Element? {
    guard first != nil else { return nil }
    return removeFirst()
  }

  public mutating func removeLastSafely() -> Element? {
    guard last != nil else { return nil }
    return removeLast()
  }

  public mutating func insertSafely(_ newElement: Element, at index: Int) {
    let index = Swift.min(index, count)
    insert(newElement, at: index)
  }

  public func at(_ index: Int) -> Element? {
    guard count > index else { return nil }
    return self[index]
  }

  public func last(_ count: Int) -> ArraySlice<Element> {
    guard self.count > count else { return self[0 ... self.count - 1] }
    return self[self.count - count ... self.count - 1]
  }

  public func first(_ count: Int) -> ArraySlice<Element> {
    guard self.count > count else { return self[0 ... self.count - 1] }
    return self[0 ... count - 1]
  }

  public var second: Element? {
    return at(1)
  }

  public var third: Element? {
    return at(2)
  }

  public var fourth: Element? {
    return at(3)
  }

  public var fifth: Element? {
    return at(4)
  }

  public var sixth: Element? {
    return at(5)
  }

  public var seventh: Element? {
    return at(6)
  }

  public var eighth: Element? {
    return at(7)
  }

  public var nineth: Element? {
    return at(8)
  }

  public var tenth: Element? {
    return at(9)
  }

  public var eleventh: Element? {
    return at(10)
  }

  public var twelfth: Element? {
    return at(11)
  }
}

extension Array where Element: SignedInteger {

  public var sum: Element {
    return reduce(0, +)
  }

  public var product: Element {
    return reduce(1, *)
  }

  public var min: Element {
    return 1
  }
}



