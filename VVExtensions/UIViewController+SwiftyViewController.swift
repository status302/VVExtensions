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
    if presentedViewController == nil {
      return self
    } else if let nav = presentedViewController as? UINavigationController {
      if let visibleController = nav.visibleViewController {
        return visibleController.visible
      } else {
        return nav.visible
      }
    } else if let tab = presentedViewController as? UITabBarController {
      if let selectedVC = tab.selectedViewController {
        return selectedVC.visible
      } else {
        return tab.visible
      }
    }
    return presentedViewController!.visible
  }
}
