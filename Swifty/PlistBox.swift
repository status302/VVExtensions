//
//  CodableBox.swift
//  Swifty
//
//  Created by 程庆春 on 2018/5/12.
//  Copyright © 2018年 vsccw. All rights reserved.
//

import Foundation

public class PlistBox<T: Codable> {
  public enum PlistError: Error {
    case pathInvalid
    case infoPlistNotFound
  }
  
  public private(set) var path: String
  
  public init(path: String) throws {
    guard FileManager.default.fileExists(atPath: path) else {
      throw PlistError.pathInvalid
    }
    self.path = path
  }
  
  public func decode() throws -> T? {
    let url = URL(fileURLWithPath: path)
    let data = try Data(contentsOf: url)
    
    let decoder = PropertyListDecoder()
    let value = try decoder.decode(T.self, from: data)
    return value
  }
}
