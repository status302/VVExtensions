//
//  NSObject+Swifty.swift
//  Swifty
//
//  Created by 程庆春 on 2018/5/13.
//  Copyright © 2018年 vsccw. All rights reserved.
//

import Foundation
import ObjectiveC.objc

public extension NSObject {

  public enum AssociatedType {
    case assign
    case retain
    case retainNonatomic
    case copy
    case copyNonatomic

    internal var policy: objc_AssociationPolicy {
      switch self {
      case .assign:
        return .OBJC_ASSOCIATION_ASSIGN
      case .retain:
        return .OBJC_ASSOCIATION_RETAIN
      case .retainNonatomic:
        return .OBJC_ASSOCIATION_RETAIN_NONATOMIC
      case .copy:
        return .OBJC_ASSOCIATION_COPY
      case .copyNonatomic:
        return .OBJC_ASSOCIATION_COPY_NONATOMIC
      }
    }
  }

  public func associatedValue(forKey key: String) -> Any? {
    guard let keyPointer = UnsafeRawPointer(bitPattern: key.hash) else { return nil }
    return objc_getAssociatedObject(self, keyPointer)
  }

  public func associate(forKey key: String, value: Any?, type: AssociatedType) {
    guard let keyPointer = UnsafeRawPointer(bitPattern: key.hash) else { return }
    objc_setAssociatedObject(self, keyPointer, value, type.policy)
  }
}
