//
//  UserDefaults+Swifty.swift
//  Swifty
//
//  Created by 程庆春 on 2018/5/13.
//  Copyright © 2018年 vsccw. All rights reserved.
//

import Foundation

public final class Key<T>: Keys { }

public class Keys: RawRepresentable, Hashable {

  public typealias RawValue = String

  public let rawValue: String

  public var hashValue: Int { return rawValue.hashValue }

  public required init?(rawValue: String) {
    self.rawValue = rawValue
  }

  public init(_ key: String) {
    self.rawValue = key
  }
}

public extension UserDefaults {
  public subscript (key: Key<Bool>) -> Bool {
    set {
      set(newValue, forKey: key.rawValue)
    }
    get {
      return bool(forKey: key.rawValue)
    }
  }

  public subscript (key: Key<String>) -> String? {
    set {
      set(newValue, forKey: key.rawValue)
    }
    get {
      return string(forKey: key.rawValue)
    }
  }

  public subscript (key: Key<Int>) -> Int {
    set {
      set(newValue, forKey: key.rawValue)
    }
    get {
      return integer(forKey: key.rawValue)
    }
  }

  public subscript (key: Key<[Any]>) -> [Any]? {
    set {
      set(newValue, forKey: key.rawValue)
    }
    get {
      return array(forKey: key.rawValue)
    }
  }

  public subscript (key: Key<Data>) -> Data? {
    set {
      set(newValue, forKey: key.rawValue)
    }
    get {
      return data(forKey: key.rawValue)
    }
  }

  public subscript (key: Key<URL>) -> URL? {
    set {
      set(newValue, forKey: key.rawValue)
    }
    get {
      return url(forKey: key.rawValue)
    }
  }

  public subscript (key: Key<[String: Any?]>) -> [String: Any?]? {
    set {
      set(newValue, forKey: key.rawValue)
    }
    get {
      return dictionary(forKey: key.rawValue)
    }
  }
}
