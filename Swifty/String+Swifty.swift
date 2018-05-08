//
//  String+Swifty.swift
//  Swifty
//
//  Created by vsccw on 2018/4/27.
//  Copyright © 2018年 vsccw. All rights reserved.
//

import Foundation

public extension String {
  public var nsstr: NSString {
    return self as NSString
  }
}

public extension NSString {
  public var str: String {
    return self as String
  }
}
