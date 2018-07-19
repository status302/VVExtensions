//
//  UIViewController+SwiftyViewController.swift
//  VVExtensions
//
//  Created by 程庆春 on 2018/7/8.
//  Copyright © 2018年 vsccw. All rights reserved.
//

import class UIKit.UIViewController

public extension UIViewController {
  public var visible: UIViewController {
    var viewController: UIViewController?
    if let navigationController = self as? UINavigationController {
      viewController = navigationController.visibleViewController
    }
    else if let tabBarController = self as? UITabBarController {
      viewController = tabBarController.selectedViewController
    }
    else {
      viewController = presentedViewController
    }

    if let viewController = viewController {
      return viewController.visible
    }
    else {
      return self
    }
  }
}

public extension UIViewController {
  public func setOrientation(_ orientation: UIInterfaceOrientation) {
    currentDevice.setValue(orientation.rawValue, forKey: "orientation")
  }
}
