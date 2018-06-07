//
//  UIColor+Swifty.swift
//  Swifty
//
//  Created by 程庆春 on 2018/6/6.
//  Copyright © 2018年 vsccw. All rights reserved.
//

import UIKit

public extension UIColor {
  public convenience init(rgb: Int) {
    self.init(rgb: rgb, alpha: 1.0)
  }

  public convenience init(rgb: Int, alpha: CGFloat) {
    let red = CGFloat((rgb >> 16) & 0xFF)
    let green = CGFloat((rgb >> 8) & 0xFF)
    let blue = CGFloat(rgb & 0xFF)
    self.init(red: red, green: green, blue: blue, alpha: alpha)
  }
}
