//
//  Device+Swifty.swift
//  Swifty
//
//  Created by vsccw on 2018/4/28.
//  Copyright © 2018年 vsccw. All rights reserved.
//

import Foundation

public var currentDevice: UIDevice {
  return .current
}

let keyOfModelName: String = "com.vsccw.UIDevice.modelName"

public extension UIDevice {
  
  var modelName: String {
    if let localModelName = localModelName {
      return localModelName
    }
    
    let name = calculateModelName()
    localModelName = name
    return name
  }
  
  var type: Type {
    return Type(rawValue: modelName) ?? .unknown
  }
  
  var isIPod: Bool {
    return type == .iPodTouch5 || type == .iPodTouch6
  }
  
  var isIPhone: Bool {
    return allPhone.contains(type)
  }
  
  var isIPad: Bool {
    return allPad.contains(type)
  }
  
  var isSimulator: Bool {
    return type == .simulator
  }
  
  var allPad: [Type] {
    return [.iPad2,
            .iPad3,
            .iPad4,
            .iPadAir,
            .iPadAir2,
            .iPad5,
            .iPad6,
            .iPadMini,
            .iPadMini2,
            .iPadMini3,
            .iPadMini4,
            .iPadPro9_7Inch,
            .iPadPro12_9Inch,
            .iPadPro12_9_2Inch,
            .iPadPro10_5Inch]
  }
  
  var allPhone: [Type] {
    return [.iPhone4,
            .iPhone4s,
            .iPhone5,
            .iPhone5c,
            .iPhone5s,
            .iPhone6,
            .iPhone6Plus,
            .iPhone6s,
            .iPhone6sPlus,
            .iPhoneSE,
            .iPhone7,
            .iPhone7Plus,
            .iPhone8,
            .iPhone8Plus,
            .iPhoneX]
  }
  
  var localModelName: String? {
    set {
      objc_setAssociatedObject(self,
                               UnsafeRawPointer(bitPattern: keyOfModelName.hash)!,
                               newValue,
                               .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
    }
    get {
      return objc_getAssociatedObject(self, UnsafeRawPointer(bitPattern: keyOfModelName.hash)!) as? String
    }
  }
  
  /// Reference: https://stackoverflow.com/a/26962452
  private func calculateModelName() -> String {
    var systemInfo = utsname()
    uname(&systemInfo)
    let machineMirror = Mirror(reflecting: systemInfo.machine)
    let identifier = machineMirror.children.reduce("") { identifier, element in
      guard let value = element.value as? Int8, value != 0 else { return identifier }
      return identifier + String(UnicodeScalar(UInt8(value)))
    }
    
    switch identifier {
    case "iPod5,1":                                 return "iPod Touch 5"
    case "iPod7,1":                                 return "iPod Touch 6"
    case "iPhone3,1", "iPhone3,2", "iPhone3,3":     return "iPhone 4"
    case "iPhone4,1":                               return "iPhone 4s"
    case "iPhone5,1", "iPhone5,2":                  return "iPhone 5"
    case "iPhone5,3", "iPhone5,4":                  return "iPhone 5c"
    case "iPhone6,1", "iPhone6,2":                  return "iPhone 5s"
    case "iPhone7,2":                               return "iPhone 6"
    case "iPhone7,1":                               return "iPhone 6 Plus"
    case "iPhone8,1":                               return "iPhone 6s"
    case "iPhone8,2":                               return "iPhone 6s Plus"
    case "iPhone9,1", "iPhone9,3":                  return "iPhone 7"
    case "iPhone9,2", "iPhone9,4":                  return "iPhone 7 Plus"
    case "iPhone8,4":                               return "iPhone SE"
    case "iPhone10,1", "iPhone10,4":                return "iPhone 8"
    case "iPhone10,2", "iPhone10,5":                return "iPhone 8 Plus"
    case "iPhone10,3", "iPhone10,6":                return "iPhone X"
    case "iPad2,1", "iPad2,2", "iPad2,3", "iPad2,4":return "iPad 2"
    case "iPad3,1", "iPad3,2", "iPad3,3":           return "iPad 3"
    case "iPad3,4", "iPad3,5", "iPad3,6":           return "iPad 4"
    case "iPad4,1", "iPad4,2", "iPad4,3":           return "iPad Air"
    case "iPad5,3", "iPad5,4":                      return "iPad Air 2"
    case "iPad6,11", "iPad6,12":                    return "iPad 5"
    case "iPad7,5", "iPad7,6":                      return "iPad 6"
    case "iPad2,5", "iPad2,6", "iPad2,7":           return "iPad Mini"
    case "iPad4,4", "iPad4,5", "iPad4,6":           return "iPad Mini 2"
    case "iPad4,7", "iPad4,8", "iPad4,9":           return "iPad Mini 3"
    case "iPad5,1", "iPad5,2":                      return "iPad Mini 4"
    case "iPad6,3", "iPad6,4":                      return "iPad Pro 9.7 Inch"
    case "iPad6,7", "iPad6,8":                      return "iPad Pro 12.9 Inch"
    case "iPad7,1", "iPad7,2":                      return "iPad Pro 12.9 Inch 2. Generation"
    case "iPad7,3", "iPad7,4":                      return "iPad Pro 10.5 Inch"
    case "AppleTV5,3":                              return "Apple TV"
    case "AppleTV6,2":                              return "Apple TV 4K"
    case "AudioAccessory1,1":                       return "HomePod"
    case "i386", "x86_64":                          return "Simulator"
    default:                                        return identifier
    }
  }
  
  enum `Type`: String {
    case iPodTouch5 = "iPod Touch 5"
    case iPodTouch6 = "iPod Touch 6"
    
    case iPhone4 = "iPhone 4"
    case iPhone4s = "iPhone 4s"
    case iPhone5 = "iPhone 5"
    case iPhone5c = "iPhone 5c"
    case iPhone5s = "iPhone 5s"
    case iPhone6 = "iPhone 6"
    case iPhone6Plus = "iPhone 6 Plus"
    case iPhone6s = "iPhone 6s"
    case iPhone6sPlus = "iPhone 6s Plus"
    case iPhone7 = "iPhone 7"
    case iPhone7Plus = "iPhone 7 Plus"
    case iPhoneSE = "iPhone SE"
    case iPhone8 = "iPhone 8"
    case iPhone8Plus = "iPhone 8 Plus"
    case iPhoneX = "iPhone X"
    
    case iPad2 = "iPad 2"
    case iPad3 = "iPad 3"
    case iPad4 = "iPad 4"
    case iPadAir = "iPad Air"
    case iPadAir2 = "iPad Air 2"
    case iPad5 = "iPad 5"
    case iPad6 = "iPad 6"
    case iPadMini = "iPad Mini"
    case iPadMini2 = "iPad Mini 2"
    case iPadMini3 = "iPad Mini 3"
    case iPadMini4 = "iPad Mini 4"
    case iPadPro9_7Inch = "iPad Pro 9.7 Inch"
    case iPadPro12_9Inch = "iPad Pro 12.9 Inch"
    case iPadPro12_9_2Inch = "iPad Pro 12.9 Inch 2. Generation"
    case iPadPro10_5Inch = "iPad Pro 10.5 Inch"
    
    case appleTV = "Apple TV"
    case appleTV4K = "Apple TV 4K"
    
    case homePod = "HomePod"
    
    case simulator = "Simulator"
    
    case unknown
  }
}
