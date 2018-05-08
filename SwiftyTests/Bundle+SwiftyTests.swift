//
//  Bundle+SwiftyTests.swift
//  SwiftyTests
//
//  Created by 程庆春 on 2018/4/30.
//  Copyright © 2018年 vsccw. All rights reserved.
//

import XCTest
import Swifty
import UIKit

class Bundle_SwiftyTests: XCTestCase {
  func testInfo() {
    let bundle = Bundle(identifier: "com.vsccw.Swifty")
    print(bundle?.infoDictionary)
    XCTAssertTrue(true)
  }
}
