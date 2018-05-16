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

  public subscript (key: String) -> Box<Any?> {
    get {
      let result = value(forKey: key)
      return Box(result)
    }
    set {
      set(newValue.value, forKey: key)
    }
  }
}

public struct Box<T> {
  public let value: T
  public init(_ value: T) {
    self.value = value
  }
}

public extension Box {
  public var string: String? {
    return value as? String
  }

  public var stringValue: String {
    return string.or("")
  }
}

public extension Box {
  public var number: NSNumber? {
    return value as? NSNumber
  }

  public var numberValue: NSNumber {
    return number.or(0)
  }
}

public extension Box {
  public var int: Int? {
    return number?.intValue
  }

  public var intValue: Int {
    return int.or(0)
  }
}

public extension Box {
  var uInt: UInt? {
    return number?.uintValue
  }

  var uIntValue: UInt {
    return uInt.or(0)
  }
}

public extension Box {
  public var int8: Int8? {
    return number?.int8Value
  }

  public var int8Value: Int8 {
    return int8.or(0)
  }
}

public extension Box {
  public var uInt8: UInt8? {
    return number?.uint8Value
  }

  public var uInt8Value: UInt8 {
    return uInt8.or(0)
  }
}

public extension Box {
  public var int16: Int16? {
    return number?.int16Value
  }

  public var int16Value: Int16 {
    return int16.or(0)
  }
}

public extension Box {
  public var uInt16: UInt16? {
    return number?.uint16Value
  }

  public var uInt16Value: UInt16 {
    return uInt16.or(0)
  }
}

public extension Box {
  public var int32: Int32? {
    return number?.int32Value
  }

  public var int32Value: Int32 {
    return int32.or(0)
  }
}

public extension Box {
  public var uInt32: UInt32? {
    return number?.uint32Value
  }

  public var uInt32Value: UInt32 {
    return uInt32.or(0)
  }
}

public extension Box {
  public var float: Float? {
    return number?.floatValue
  }

  public var floatValue: Float {
    return (number?.floatValue).or(0)
  }
}
