//
//  MainViewController.swift
//  SideMenu
//
//  Created by MAC on 12/12/18.
//  Copyright © 2018 MAC. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    var sideMenuOpen = false
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        NotificationCenter.default.addObserver(self, selector: #selector(showHocLuat), name: NSNotification.Name("ShowHocLuat"), object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(showThiThu), name: NSNotification.Name("ShowThiThu"), object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(showMeoThi), name: NSNotification.Name("ShowMeoThi"), object: nil)
        
        let leftSwipe = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipes(_:)))
        let rightSwipe = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipes(_:)))
        
        leftSwipe.direction = .left
        rightSwipe.direction = .right
        
        view.addGestureRecognizer(leftSwipe)
        view.addGestureRecognizer(rightSwipe)
        
    }
    
    @objc func handleSwipes(_ sender:UISwipeGestureRecognizer)
    {
        if (sender.direction == .right)
        {
            if sideMenuOpen {
                sideMenuOpen = false
            } else {
                sideMenuOpen = true
                NotificationCenter.default.post(name: NSNotification.Name("ToggleSideMenu"), object: nil)
            }
        }
        
        if (sender.direction == .left)
        {
            if sideMenuOpen {
                sideMenuOpen = false
                NotificationCenter.default.post(name: NSNotification.Name("ToggleSideMenu"), object: nil)
            }
        }
    }
    
    @objc func showHocLuat() {
        performSegue(withIdentifier: "ShowHocLuat", sender: nil)
    }
    
    @objc func showThiThu() {
        performSegue(withIdentifier: "ShowThiThu", sender: nil)
    }
    
    @objc func showMeoThi() {
        performSegue(withIdentifier: "ShowMeoThi", sender: nil)
    }
    
    @IBAction func sideMenuTapped() {
        NotificationCenter.default.post(name: NSNotification.Name("ToggleSideMenu"), object: nil)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
