//
//  ViewController.swift
//  SideMenu
//
//  Created by MAC on 11/18/18.
//  Copyright © 2018 MAC. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var sideMenuConstraint: NSLayoutConstraint!
    var sideMenuOpen = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        NotificationCenter.default.addObserver(self, selector: #selector(toggleSideMenu), name: NSNotification.Name("ToggleSideMenu"), object: nil)
        
    }
    
    @objc func toggleSideMenu() {
        sideMenuConstraint.constant = 0
        if sideMenuOpen {
            sideMenuOpen = false
            sideMenuConstraint.constant = -243
        } else {
            sideMenuOpen = true
            sideMenuConstraint.constant = 0
        }
        UIView.animate(withDuration: 0.3) {
            self.view.layoutIfNeeded()
        }
    }

}

