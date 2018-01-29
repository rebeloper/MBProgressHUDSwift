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
  
  static func runHud(_ action: HudAction, onView: UIView, onWindow: UIWindow) {
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
      cancelationExample(onView: onView)
    case .modeSwitchingExample:
      modeSwitchingExample(onView: onView)
    case .windowExample:
      windowExample(onWindow: onWindow)
    case .networkingExample:
      networkingExample(onView: onView)
    case .determinateNSProgressExample:
      determinateNSProgressExample(onView: onView)
    case .dimBackgroundExample:
      dimBackgroundExample(onView: onView)
    case .colorExample:
      colorExample(onView: onView)
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
  
  fileprivate static func cancelationExample(onView: UIView) {
    let hud = MBProgressHUD.showAdded(to: onView, animated: true)
    hud.mode = .determinate
    hud.label.text = "Loading..."
    hud.button.setTitle("Cancel", for: .normal)
    hud.button.addTarget(self, action: #selector(cancelWork), for: .touchUpInside)
    
    DispatchQueue.global(qos: .background).async {
      doSomethingWithProgress(in: hud)
      DispatchQueue.main.async {
        hud.hide(animated: true)
      }
    }
  }
  
  fileprivate static func modeSwitchingExample(onView: UIView) {
    let hud = MBProgressHUD.showAdded(to: onView, animated: true)
    hud.mode = .indeterminate
    hud.label.text = "Preparing..."
    
    DispatchQueue.global(qos: .background).async {
      doSomethingWithMixedProgress(in: hud)
      DispatchQueue.main.async {
        hud.hide(animated: true)
      }
    }
  }
  
  fileprivate static func windowExample(onWindow: UIWindow) {
    let hud = MBProgressHUD.showAdded(to: onWindow, animated: true)
    hud.mode = .indeterminate
    
    DispatchQueue.global(qos: .background).async {
      doSomething()
      DispatchQueue.main.async {
        hud.hide(animated: true)
      }
    }
  }
  
  fileprivate static func networkingExample(onView: UIView) {
    let hud = MBProgressHUD.showAdded(to: onView, animated: true)
    hud.label.text = "Downloading..."
    doSomeNetworkWorkWithProgress(in: hud)
  }
  
  fileprivate static func determinateNSProgressExample(onView: UIView) {
    let hud = MBProgressHUD.showAdded(to: onView, animated: true)
    hud.mode = .determinate
    hud.label.text = "Loading..."
    let progressObject = Progress(totalUnitCount: 100)
    hud.progressObject = progressObject
    hud.button.setTitle("Cancel", for: .normal)
    hud.button.addTarget(progressObject, action: #selector(Progress.cancel), for: .touchUpInside)
    DispatchQueue.global(qos: .background).async {
      doSomeWorkWith(progressObject)
      DispatchQueue.main.async {
        hud.hide(animated: true)
      }
    }
  }
  
  fileprivate static func dimBackgroundExample(onView: UIView) {
    let hud = MBProgressHUD.showAdded(to: onView, animated: true)
    hud.mode = .indeterminate
    hud.backgroundView.style = .solidColor
    hud.backgroundView.color = UIColor(white: 0.0, alpha: 0.1)
    
    DispatchQueue.global(qos: .background).async {
      doSomething()
      DispatchQueue.main.async {
        hud.hide(animated: true)
      }
    }
  }
  
  fileprivate static func colorExample(onView: UIView) {
    let hud = MBProgressHUD.showAdded(to: onView, animated: true)
    hud.mode = .indeterminate
    hud.label.text = "Purple..."
    hud.contentColor = .purple
    
    DispatchQueue.global(qos: .background).async {
      doSomething()
      DispatchQueue.main.async {
        hud.hide(animated: true)
      }
    }
  }
  
  // MARK: Tasks
  
  fileprivate static func doSomething() {
    sleep(5)
  }
  
  fileprivate static var isCanceled = false
  
  fileprivate static func doSomethingWithProgress(in hud: MBProgressHUD) {
    isCanceled = false
    var progress:Float = 0.0
    while progress < 1.0 {
      if isCanceled { return }
      progress += 0.1
      DispatchQueue.main.async {
        hud.progress = progress
      }
      usleep(50000)
    }
  }
  
  @objc fileprivate static func cancelWork() {
    isCanceled = true
  }
  
  fileprivate static func doSomethingWithMixedProgress(in hud: MBProgressHUD) {
    sleep(2)
    
    DispatchQueue.main.async {
      hud.mode = .determinate
      hud.label.text = "Loading..."
    }
    
    var progress:Float = 0.0
    while progress < 1.0 {
      progress += 0.1
      DispatchQueue.main.async {
        hud.progress = progress
      }
      usleep(50000)
    }
    
    DispatchQueue.main.async {
      hud.mode = .indeterminate
      hud.label.text = "Cleaning up..."
    }
    sleep(3)
    
    DispatchQueue.main.async {
      hud.mode = .customView
      hud.label.text = "Done"
      hud.isSquare = true
      hud.customView = UIImageView(image: #imageLiteral(resourceName: "Checkmark"))
    }
    sleep(2)
  }
  
  fileprivate static func doSomeNetworkWorkWithProgress(in hud: MBProgressHUD) {
    let session = URLSession(configuration: .default)
    guard let url = URL(string: "https://support.apple.com/library/APPLE/APPLECARE_ALLGEOS/HT1425/sample_iPod.m4v.zip") else {
      DispatchQueue.main.async {
        hud.mode = .text
        hud.label.text = "Network Error"
        hud.detailsLabel.text = "Please, check your internet connection and try later."
        hud.hide(animated: true, afterDelay: 3)
      }
      return
    }
    let task = session.downloadTask(with: url) { (url, response, err) in
      if err != nil {
        print(err ?? "error")
        DispatchQueue.main.async {
          hud.mode = .text
          hud.label.text = "Network Error"
          hud.detailsLabel.text = "Please, check your internet connection and try later."
          hud.hide(animated: true, afterDelay: 3)
        }
        return
      }
      DispatchQueue.main.async {
        hud.mode = .customView
        hud.label.text = "Done"
        hud.customView = UIImageView(image: #imageLiteral(resourceName: "Checkmark"))
        hud.isSquare = true
        hud.hide(animated: true, afterDelay: 3)
      }
    }
    task.resume()
  }
  
  fileprivate static func doSomeWorkWith(_ progressObject: Progress) {
    while progressObject.fractionCompleted < 1.0 {
      if progressObject.isCancelled { break }
      progressObject.becomeCurrent(withPendingUnitCount: 1)
      progressObject.resignCurrent()
      usleep(50000);
    }
  }
  
}

























