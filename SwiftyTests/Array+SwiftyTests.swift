//
//  Array+SwiftyTests.swift
//  SwiftyTests
//
//  Created by 程庆春 on 2018/4/28.
//  Copyright © 2018年 vsccw. All rights reserved.
//

import XCTest
@testable import Swifty

class ArraySwiftyTests: XCTestCase {
  
  func testRemoveFirstSafely() {
    var array: [String] = []
    let item = array.removeFirstSafely()
    assert(item == nil)

    var array1 = ["1"]
    let item1 = array1.removeFirstSafely()
    assert(item1 == "1")
    assert(array1.isEmpty)
  }

  func testRemoveLastSafely() {
    var array: [String] = []
    let item = array.removeLastSafely()
    assert(item == nil)

    var array1 = ["1"]
    let item1 = array1.removeLastSafely()
    assert(item1 == "1")
    assert(array1.isEmpty)
  }

  func testInsertSafely() {
    var array: [String] = []
    array.insertSafely("123", at: 10)
    assert(array.count == 1)
    assert(array[0] == "123")
  }

  func testAt() {
    let array = [1, 2, 3, 4, 5]
    assert(array.at(0) == 1)
    assert(array.at(1) == 2)
    assert(array.at(5) == nil)
  }

  func testIndex() {
    let array = [1, 2, 3, 4, 5, 6]
    assert(array.second == 2)
    assert(array.third == 3)
    assert(array.eleventh == nil)
  }

  func testLast() {
    let array = [1, 2, 3, 4, 5, 6]
    assert(array.last(2) == [5, 6])
    assert(array.last(10) == [1, 2, 3, 4, 5, 6])
  }

  func testFirst() {
    let array = [1, 2, 3, 4, 5, 6]
    assert(array.first(2) == [1, 2])
    assert(array.first(10) == [1, 2, 3, 4, 5, 6])
  }

}
