//
//  UserDefaults+SwiftyTests.swift
//  SwiftyTests
//
//  Created by 程庆春 on 2018/5/13.
//  Copyright © 2018年 vsccw. All rights reserved.
//

import XCTest
import VVExtensions

extension VVExtensions.Keys {
  static let boolKey = Key<Bool>("bool_key")
  static let stringKey = Key<String>("string_key")
  static let intKey = Key<Int>("int_key")
  static let arrayKey = Key<[Any]>("array_key")
  static let dataKey = Key<Data>("data_key")
  static let urlKey = Key<URL>("url_key")
  static var dictionaryKey: Key<[String: Any?]> { return Key<[String: Any?]>("url_key") }
}

class UserDefaults_SwiftyTests: XCTestCase {
  let defaults = UserDefaults.standard

  func testInt() {
    defaults[.intKey] = 3
    XCTAssert(defaults[.intKey] == 3)
  }

  func testString() {
    defaults[.stringKey] = "hello"
    XCTAssert(defaults[.stringKey] == "hello")
  }

  func testBool() {
    defaults[.boolKey] = true
    XCTAssert(defaults[.boolKey] == true)
  }

  func testObject() {
    let hello = "hello world"
    let data = hello.data(using: .utf8)
    defaults[.dataKey] = data
    XCTAssert(defaults[.dataKey] == data)
  }

  func testArray() {
    let array = ["1234", "1", "2"]
    defaults[.arrayKey] = array
    let values = defaults[.arrayKey] as? [String]
    XCTAssert(values.or([]).isEqual(to: array))
  }

  func testURL() {
    let url = URL(string: "https://blog.vsccw.com")
    defaults[.urlKey] = url
    XCTAssert(defaults[.urlKey] == url)
  }

  func testDictionary() {
    let dict = ["1": 1, "2": 2]
    defaults[.dictionaryKey] = dict
    let value = defaults[.dictionaryKey] as? [String: Int]
    XCTAssert(value.or([:]).isEqual(to: dict))
  }
}
