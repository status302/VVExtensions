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
    XCTAssert(item == nil)

    var array1 = ["1"]
    let item1 = array1.removeFirstSafely()
    XCTAssert(item1 == "1")
    XCTAssert(array1.isEmpty)
  }

  func testRemoveLastSafely() {
    var array: [String] = []
    let item = array.removeLastSafely()
    XCTAssert(item == nil)

    var array1 = ["1"]
    let item1 = array1.removeLastSafely()
    XCTAssert(item1 == "1")
    XCTAssert(array1.isEmpty)
  }

  func testInsertSafely() {
    var array: [String] = []
    array.insertSafely("123", at: 10)
    XCTAssert(array.count == 1)
    XCTAssert(array[0] == "123")
  }

  func testAt() {
    let array = [1, 2, 3, 4, 5]
    XCTAssert(array.at(0) == 1)
    XCTAssert(array.at(1) == 2)
    XCTAssert(array.at(5) == nil)
  }

  func testIndex() {
    let array = [1, 2, 3, 4, 5, 6]
    XCTAssert(array.second == 2)
    XCTAssert(array.third == 3)
    XCTAssert(array.eleventh == nil)
  }

  func testLast() {
    let array = [1, 2, 3, 4, 5, 6]
    XCTAssert(array.last(2) == [5, 6])
    XCTAssert(array.last(10) == [1, 2, 3, 4, 5, 6])
  }

  func testFirst() {
    let array = [1, 2, 3, 4, 5, 6]
    XCTAssert(array.first(2) == [1, 2])
    XCTAssert(array.first(10) == [1, 2, 3, 4, 5, 6])
  }

  func testMin() {
    let array = [7, 1, 5, 4, 5, 6]
    XCTAssert(array.min == 1)
  }

  func testMax() {
    let array = [7, 1, 5, 4, 5, 6]
    XCTAssert(array.max == 7)
  }

  func testSum() {
    let array = [7, 1, 5, 4, 5, 6]
    XCTAssert(array.sum == 28)
  }

  func testProduct() {
    let array = [7, 1, 5, 4, 5, 6]
    XCTAssert(array.product == 4200)
  }

  func testAverage() {
    let array = [7, 1, 5, 4, 5, 6]
    XCTAssert(array.average == 28 / 6)
  }
}
