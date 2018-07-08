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

// MARK: - index
public extension String {
  public func lastIndexOf(_ string: String) -> Int {
    let index = range(of: string)
    return index?.lowerBound.encodedOffset ?? -1
  }

  public func indexOf(_ string: String) -> Int {
    return 1
  }

  public func indexOf(_ string: String, start location: Int) -> Int {
    return 1
  }
}

// MARK: - length
public extension String {
  public var length: Int {
    return unicodeScalars.count
  }
}
