//
//  Hud.swift
//  MBProgressHUDSwift
//
//  Created by Alex Nagy on 27/01/2018.
//  Copyright © 2018 Alex Nagy. All rights reserved.
//

import UIKit
import MBProgressHUD

class Hud {
  
  let titleLabelText: String
  let action: HudAction
  
  enum HudAction {
    case indeterminateExample,
    labelExample,
    detailsLabelExample,
    determinateExample,
    annularDeterminateExample,
    barDeterminateExample,
    textExample,
    customViewExample,
    cancelationExample,
    modeSwitchingExample,
    windowExample,
    networkingExample,
    determinateNSProgressExample,
    dimBackgroundExample,
    colorExample
  }
  
  init(labelText: String, action: HudAction) {
    self.titleLabelText = labelText
    self.action = action
  }
  
  static func runHud(_ action: HudAction, onView: UIView) {
    print("Running hud action:", action)
    switch action {
    case .indeterminateExample:
      indeterminateExample(onView: onView)
    case .labelExample:
      labelExample(onView: onView)
    case .detailsLabelExample:
      detailsLabelExample(onView: onView)
    case .determinateExample:
      determinateExample(onView: onView)
    case .annularDeterminateExample:
      annularDeterminateExample(onView: onView)
    case .barDeterminateExample:
      barDeterminateExample(onView: onView)
    case .textExample:
      textExample(onView: onView)
    case .customViewExample:
      customViewExample(onView: onView)
    case .cancelationExample:
      cancelationExample()
    case .modeSwitchingExample:
      modeSwitchingExample()
    case .windowExample:
      windowExample()
    case .networkingExample:
      networkingExample()
    case .determinateNSProgressExample:
      determinateNSProgressExample()
    case .dimBackgroundExample:
      dimBackgroundExample()
    case .colorExample:
      colorExample()
    }
  }
  
  fileprivate static func indeterminateExample(onView: UIView) {
    let hud = MBProgressHUD.showAdded(to: onView, animated: true)
    hud.mode = .indeterminate
    
    DispatchQueue.global(qos: .background).async {
      doSomething()
      DispatchQueue.main.async {
        hud.hide(animated: true)
      }
    }
  }
  
  fileprivate static func labelExample(onView: UIView) {
    let hud = MBProgressHUD.showAdded(to: onView, animated: true)
    hud.label.text = "Loading..."
    
    DispatchQueue.global(qos: .background).async {
      doSomething()
      DispatchQueue.main.async {
        hud.hide(animated: true)
      }
    }
  }
  
  fileprivate static func detailsLabelExample(onView: UIView) {
    let hud = MBProgressHUD.showAdded(to: onView, animated: true)
    hud.label.text = "Loading..."
    hud.detailsLabel.text = "Processing\n1/1"
    
    DispatchQueue.global(qos: .background).async {
      doSomething()
      DispatchQueue.main.async {
        hud.hide(animated: true)
      }
    }
  }
  
  fileprivate static func determinateExample(onView: UIView) {
    let hud = MBProgressHUD.showAdded(to: onView, animated: true)
    hud.mode = .determinate
    hud.label.text = "Loading..."
    
    DispatchQueue.global(qos: .background).async {
      doSomethingWithProgress(in: hud)
      DispatchQueue.main.async {
        hud.hide(animated: true)
      }
    }
  }
  
  fileprivate static func annularDeterminateExample(onView: UIView) {
    let hud = MBProgressHUD.showAdded(to: onView, animated: true)
    hud.mode = .annularDeterminate
    hud.label.text = "Loading..."
    
    DispatchQueue.global(qos: .background).async {
      doSomethingWithProgress(in: hud)
      DispatchQueue.main.async {
        hud.hide(animated: true)
      }
    }
  }
  
  fileprivate static func barDeterminateExample(onView: UIView) {
    let hud = MBProgressHUD.showAdded(to: onView, animated: true)
    hud.mode = .determinateHorizontalBar
    hud.label.text = "Loading..."
    
    DispatchQueue.global(qos: .background).async {
      doSomethingWithProgress(in: hud)
      DispatchQueue.main.async {
        hud.hide(animated: true)
      }
    }
  }
  
  fileprivate static func textExample(onView: UIView) {
    let hud = MBProgressHUD.showAdded(to: onView, animated: true)
    hud.mode = .text
    hud.label.text = "Message here!"
    hud.offset = CGPoint(x: 0.0, y: MBProgressMaxOffset)
    
    hud.hide(animated: true, afterDelay: 3)
  }
  
  fileprivate static func customViewExample(onView: UIView) {
    let hud = MBProgressHUD.showAdded(to: onView, animated: true)
    hud.mode = .customView
    hud.label.text = "Success"
    hud.isSquare = true
    hud.customView = UIImageView(image: #imageLiteral(resourceName: "Checkmark"))
    
    hud.hide(animated: true, afterDelay: 3)
  }
  
  fileprivate static func cancelationExample() {
    
  }
  
  fileprivate static func modeSwitchingExample() {
    
  }
  
  fileprivate static func windowExample() {
    
  }
  
  fileprivate static func networkingExample() {
    
  }
  
  fileprivate static func determinateNSProgressExample() {
    
  }
  
  fileprivate static func dimBackgroundExample() {
    
  }
  
  fileprivate static func colorExample() {
    
  }
  
  // MARK: Tasks
  
  fileprivate static func doSomething() {
    sleep(5)
  }
  
  fileprivate static func doSomethingWithProgress(in hud: MBProgressHUD) {
    var progress:Float = 0.0
    while progress < 1.0 {
      progress += 0.1
      DispatchQueue.main.async {
        hud.progress = progress
      }
      usleep(50000)
    }
  }
}

























