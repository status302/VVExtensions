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
  public struct Info: Codable {

    enum CodingKeys: String, CodingKey {
      case version = "CFBundleShortVersionString"
      case bundleName = "CFBundleName"
      case bundleIdentifier = "CFBundleIdentifier"
      case build = "CFBundleVersion"
      case minOSVersion = "MinimumOSVersion"
      case developmentRegion = "CFBundleDevelopmentRegion"
    }

    public let version: String
    public let bundleName: String
    public let bundleIdentifier: String
    public let build: String
    public let minOSVersion: String
    public let developmentRegion: String
  }

  public var info: Info? {
    return internalInfo
  }

  internal var internalInfo: Info? {
    if let info = associatedValue(forKey: AssociatedKey.keyOfInfoPlist) as? Info {
      return info
    } else {
      let info = try? infoPlist()
      associate(forKey: AssociatedKey.keyOfInfoPlist, value: info, type: .retainNonatomic)
      return info
    }
  }

  internal func infoPlist() throws -> Bundle.Info {
    guard let dict = infoDictionary else {
      throw NSError(domain: "1", code: 0, userInfo: [:]) //TODO: - xx -
    }
    let data = try JSONSerialization.data(withJSONObject: dict, options: .prettyPrinted)
    let value = try JSONDecoder().decode(Info.self, from: data)
    return value
  }
  
}
