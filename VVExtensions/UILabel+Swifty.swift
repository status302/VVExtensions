//
//  UILabel+Swifty.swift
//  Swifty
//
//  Created by 程庆春 on 2018/5/7.
//  Copyright © 2018年 vsccw. All rights reserved.
//

import UIKit

public extension UILabel {

  public func contentHeight(maxWidth width: CGFloat) -> CGFloat {
    let label = UILabel()
    label.font = font
    label.textAlignment = textAlignment
    if let attributeString = attributedText {
      label.attributedText = attributeString
    } else if let text = text {
      label.text = text
    }
    label.frame.size.width = width
    label.sizeToFit()
    return label.frame.height
  }

  public func contentWidth(maxHeight height: CGFloat) -> CGFloat {
    let label = UILabel()
    label.font = font
    label.textAlignment = textAlignment
    if let attributeString = attributedText {
      label.attributedText = attributeString
    } else if let text = text {
      label.text = text
    }
    label.frame.size.height = height
    label.sizeToFit()
    return label.frame.width
  }

}
