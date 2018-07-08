//
//  Bundle+SwiftyTests.swift
//  SwiftyTests
//
//  Created by 程庆春 on 2018/4/30.
//  Copyright © 2018年 vsccw. All rights reserved.
//

import XCTest
import VVExtensions
import UIKit

class Bundle_SwiftyTests: XCTestCase {
  lazy var info: Bundle.Info? = {
    let bundle = Bundle(identifier: "com.vsccw.Swifty")
    return bundle?.info
  }()

  func testInfo() {
    XCTAssert(info != nil)
  }

  func testInfoVersion() {
    XCTAssert(info?.version == "1.0")
  }

  func testInfoBuild() {
    XCTAssert(info?.build == "1")
  }

  func testInfoOsMinVersion() {
    XCTAssert(info?.minOSVersion == "9.0")
  }
}
