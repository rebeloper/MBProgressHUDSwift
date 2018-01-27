//
//  HudCell.swift
//  MBProgressHUDSwift
//
//  Created by Alex Nagy on 27/01/2018.
//  Copyright © 2018 Alex Nagy. All rights reserved.
//

import UIKit
import LBTAComponents

class HudCell: UICollectionViewCell {
  
  let titleLabel: UILabel = {
    let label = UILabel()
    return label
  }()
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    backgroundColor = .white
    setupViews()
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  fileprivate func setupViews() {
    addSubview(titleLabel)
    titleLabel.anchorCenterSuperview()
  }
}
