//
//  Hud.swift
//  MBProgressHUDSwift
//
//  Created by Alex Nagy on 27/01/2018.
//  Copyright © 2018 Alex Nagy. All rights reserved.
//

import Foundation

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
  
  static func runHud(_ action: HudAction) {
    print("Running hud action:", action)
    switch action {
    case .indeterminateExample:
      indeterminateExample()
    case .labelExample:
      labelExample()
    case .detailsLabelExample:
      detailsLabelExample()
    case .determinateExample:
      determinateExample()
    case .annularDeterminateExample:
      annularDeterminateExample()
    case .barDeterminateExample:
      barDeterminateExample()
    case .textExample:
      textExample()
    case .customViewExample:
      customViewExample()
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
  
  fileprivate static func indeterminateExample() {
    
  }
  
  fileprivate static func labelExample() {
    
  }
  
  fileprivate static func detailsLabelExample() {
    
  }
  
  fileprivate static func determinateExample() {
    
  }
  
  fileprivate static func annularDeterminateExample() {
    
  }
  
  fileprivate static func barDeterminateExample() {
    
  }
  
  fileprivate static func textExample() {
    
  }
  
  fileprivate static func customViewExample() {
    
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
}
