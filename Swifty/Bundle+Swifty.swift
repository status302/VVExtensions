//
//  Bundle+Swifty.swift
//  Swifty
//
//  Created by vsccw on 2018/4/28.
//  Copyright © 2018年 vsccw. All rights reserved.
//

import Foundation

public var mainBundle: Bundle {
    return Bundle.main
}

extension Bundle {
  struct Info {
    let version: String
    let displayName: String
    let bundleIdentifier: String
    let build: String
//    let

    init?(dict: [String: Any]?) {
      self.version = ""
      self.displayName = ""
      self.bundleIdentifier = ""
      self.build = ""
    }
  }

  var info: Info? {
    return Info(dict: infoDictionary)
  }

  public var infoPlist: [String: Any]? {
    return infoDictionary
  }

  
}
