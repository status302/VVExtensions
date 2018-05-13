//
//  UserDefaults+Swifty.swift
//  Swifty
//
//  Created by 程庆春 on 2018/5/13.
//  Copyright © 2018年 vsccw. All rights reserved.
//

import Foundation

public extension UserDefaults {
  
  public subscript<T> (key: String) -> T? {
    get {
      return value(forKey: key) as? T
    }
    set {
      set(newValue, forKey: key)
    }
  }
}
