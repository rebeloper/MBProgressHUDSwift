//
//  HudsController.swift
//  MBProgressHUDSwift
//
//  Created by Alex Nagy on 27/01/2018.
//  Copyright © 2018 Alex Nagy. All rights reserved.
//

import UIKit

private let reuseIdentifier = "Cell"

class HudsController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
  
  let hud00 = Hud(labelText: "Indeterminate mode", action: .indeterminateExample)
  let hud01 = Hud(labelText: "With label", action: .labelExample)
  let hud02 = Hud(labelText: "With details label", action: .detailsLabelExample)
  let hud10 = Hud(labelText: "Determinate mode", action: .determinateExample)
  let hud11 = Hud(labelText: "Annular determinate mode", action: .annularDeterminateExample)
  let hud12 = Hud(labelText: "Bar determinate mode", action: .barDeterminateExample)
  let hud20 = Hud(labelText: "Text only", action: .textExample)
  let hud21 = Hud(labelText: "Custom view", action: .customViewExample)
  let hud22 = Hud(labelText: "With action button", action: .cancelationExample)
  let hud23 = Hud(labelText: "Mode switching", action: .modeSwitchingExample)
  let hud30 = Hud(labelText: "On window", action: .windowExample)
  let hud31 = Hud(labelText: "NSURLSession", action: .networkingExample)
  let hud32 = Hud(labelText: "Determinate with NSProgress", action: .determinateNSProgressExample)
  let hud33 = Hud(labelText: "Dim background", action: .dimBackgroundExample)
  let hud34 = Hud(labelText: "Colored", action: .colorExample)
  
  lazy var huds: [[Hud]] = [[hud00, hud01, hud02],
                            [hud10, hud11, hud12],
                            [hud20, hud21, hud22, hud23],
                            [hud30, hud31, hud32, hud33, hud34]]
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    collectionView?.backgroundColor = UIColor(white: 1.0, alpha: 0.9)
    navigationItem.title = "MBProgressHUDSwift"
    
    // Register cell classes
    self.collectionView!.register(HudCell.self, forCellWithReuseIdentifier: reuseIdentifier)
    
    // Do any additional setup after loading the view.
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
  // MARK: UICollectionViewDataSource
  
  override func numberOfSections(in collectionView: UICollectionView) -> Int {
    // #warning Incomplete implementation, return the number of sections
    return huds.count
  }
  
  
  override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    // #warning Incomplete implementation, return the number of items
    return huds[section].count
  }
  
  override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! HudCell
    cell.titleLabel.text = huds[indexPath.section][indexPath.row].titleLabelText
    return cell
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    return CGSize(width: collectionView.frame.size.width, height: 45)
  }
  
  override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    guard let view = navigationController?.view else { return }
    guard let window = view.window else { return }
    Hud.runHud(huds[indexPath.section][indexPath.row].action, onView: view, onWindow: window)
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
    return CGSize(width: collectionView.frame.size.width, height: 30)
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
    return 1.0
  }
  
}

















