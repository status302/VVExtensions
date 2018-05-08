//
//  UILabel+SwiftyTests.swift
//  SwiftyTests
//
//  Created by 程庆春 on 2018/5/7.
//  Copyright © 2018年 vsccw. All rights reserved.
//

import XCTest
import Swifty

class UILabel_SwiftyTests: XCTestCase {
  func testContentHeight() {
    let label = UILabel()
    label.text = "Hello World"
    label.frame = CGRect(origin: .zero, size: CGSize(width: 100, height: 0  ))
    let originHeight = label.contentHeight(maxWidth: 100)
    label.sizeToFit()
    assert(originHeight == label.frame.height)
  }
}
