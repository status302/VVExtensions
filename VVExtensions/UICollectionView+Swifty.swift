//
//  UICollectionView.swift
//  VVExtensions
//
//  Created by 程庆春 on 2018/7/28.
//  Copyright © 2018 vsccw. All rights reserved.
//

import UIKit

public extension UICollectionView {
  func reloadDataWithoutAnimation() {
    CATransaction.begin()
    CATransaction.disableActions()
    reloadData()
    CATransaction.commit()
  }
}
