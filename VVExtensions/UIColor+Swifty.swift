//
//  UIColor+Swifty.swift
//  Swifty
//
//  Created by 程庆春 on 2018/6/6.
//  Copyright © 2018年 vsccw. All rights reserved.
//

import UIKit

public extension UIColor {
  convenience init(rgb: Int) {
    self.init(rgb: rgb, alpha: 1.0)
  }

  convenience init(rgb: Int, alpha: CGFloat) {
    let red = CGFloat((rgb >> 16) & 0xFF) / 255.0
    let green = CGFloat((rgb >> 8) & 0xFF) / 255.0
    let blue = CGFloat(rgb & 0xFF) / 255.0
    self.init(red: red, green: green, blue: blue, alpha: alpha)
  }
}

public extension UIColor {

  struct Components {
    let red: CGFloat
    let green: CGFloat
    let blue: CGFloat
    let alpha: CGFloat
  }

  func transitionToColor(_ color: UIColor, ratio: CGFloat) -> UIColor {
    let offset = calculateColorOffset(withColor: color)
    let current = rgbs
    let red = current.red + ratio * offset.red
    let green = current.green + ratio * offset.green
    let blue = current.blue + ratio * offset.blue
    let alpha = current.alpha + ratio * offset.alpha
    return UIColor(red: red, green: green, blue: blue, alpha: alpha)
  }

  private var rgbs: Components {
    var red: CGFloat = 0
    var green: CGFloat = 0
    var blue: CGFloat = 0
    var alpha: CGFloat = 0
    if getRed(&red, green: &green, blue: &blue, alpha: &alpha) {
      return Components(red: red, green: green, blue: blue, alpha: alpha)
    } else if let components = cgColor.components, components.count > 3 {
      let red = components[0]
      let green = components[1]
      let blue = components[2]
      let alpha = components[3]
      return Components(red: red, green: green, blue: blue, alpha: alpha)
    } else {
      return Components(red: 0, green: 0, blue: 0, alpha: 0)
    }
  }

  private func calculateColorOffset(withColor color: UIColor) -> Components {
    let begin = rgbs
    let end = color.rgbs
    return Components(red: end.red - begin.red,
                      green: end.green - begin.green,
                      blue: end.blue - begin.blue,
                      alpha: end.alpha - begin.alpha)
  }
}
