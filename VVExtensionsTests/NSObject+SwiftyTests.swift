//
//  NSObject+SwiftyTests.swift
//  SwiftyTests
//
//  Created by 程庆春 on 2018/5/13.
//  Copyright © 2018年 vsccw. All rights reserved.
//

import XCTest
import VVExtensions

class AssociatedObject: NSObject {
  let intKey = "intValue.key"
  let strKey = "stringValue.key"
}

extension AssociatedObject {
  var intValueAssign: Int? {
    get {
      return associatedValue(forKey: intKey) as? Int
    }
    set {
      associate(forKey: intKey, value: newValue, type: .assign)
    }
  }

  var strValue: String? {
    get {
      return associatedValue(forKey: strKey) as? String
    }
    set {
      associate(forKey: strKey, value: newValue, type: .copyNonatomic)
    }
  }
}

class NSObject_SwiftyTests: XCTestCase {

  let obj = AssociatedObject()

  func testIntValue() {
    obj.intValueAssign = 3
    XCTAssert(obj.intValueAssign == 3)
  }

  func testStr() {
    obj.strValue = "hello"
    XCTAssert(obj.strValue == "hello")
  }
}
