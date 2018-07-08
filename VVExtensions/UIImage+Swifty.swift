//
//  UIImage+Swifty.swift
//  Swifty
//
//  Created by 程庆春 on 2018/6/6.
//  Copyright © 2018年 vsccw. All rights reserved.
//

import UIKit

public extension UIImage {
  public class func createImage(with color: UIColor, size: CGSize = CGSize(width: 1, height: 1)) -> UIImage? {
    UIGraphicsBeginImageContextWithOptions(size, false, 0)
    color.setFill()
    UIRectFill(CGRect(origin: .zero, size: size))
    let image = UIGraphicsGetImageFromCurrentImageContext()
    defer { UIGraphicsEndImageContext() }
    return image
  }

  public func color(forPoint point: CGPoint) -> UIColor {
    return .clear
  }

  public func fillColor(_ color: UIColor) -> UIImage? {
    let newImage = withRenderingMode(.alwaysTemplate)
    UIGraphicsBeginImageContextWithOptions(newImage.size, false, newImage.scale)
    let context = UIGraphicsGetCurrentContext()
    context?.translateBy(x: 0, y: newImage.size.height)
    context?.scaleBy(x: 1.0, y: -1.0)
    context?.setBlendMode(.normal)
    guard let cgImage = newImage.cgImage else { return newImage }
    context?.clip(to: CGRect(origin: .zero, size: newImage.size), mask: cgImage)
    color.setFill()
    context?.fill(CGRect(origin: .zero, size: newImage.size))
    let image = UIGraphicsGetImageFromCurrentImageContext()
    defer { UIGraphicsEndImageContext() }
    return image
  }

  // 图片剪裁

  // 图片加圆角

  // 缩略图
}
