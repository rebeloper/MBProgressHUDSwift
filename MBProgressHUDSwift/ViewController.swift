//
//  ViewController.swift
//  MBProgressHUDSwift
//
//  Created by Alex Nagy on 26/01/2018.
//  Copyright © 2018 Alex Nagy. All rights reserved.
//

import UIKit
import MBProgressHUD

class ViewController: UIViewController, MBProgressHUDDelegate {

  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
    view.backgroundColor = .purple
    
    let hud = MBProgressHUD.showAdded(to: self.view, animated: true)
    hud.mode = .indeterminate
//    hud.minShowTime = 10
    hud.hide(animated: true, afterDelay: 5)
    hud.delegate = self
    hud.completionBlock = {
      print("Hud was hidden and waiting for a completion handler here")
    }
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }

  func hudWasHidden(_ hud: MBProgressHUD) {
    print("Hud was hidden")
  }

}

