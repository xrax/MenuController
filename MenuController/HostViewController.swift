//
//  ViewController.swift
//  MenuController
//
//  Created by Leonardo Armero Barbosa on 4/4/17.
//  Copyright © 2017 Leonardo Armero Barbosa. All rights reserved.
//

import UIKit
import LABMenu

class HostViewController: LABMenuViewController {
    
    override func viewDidLoad() {
        // menuView properties
        barColor = .lightGray
        menuProportionalWidth = 0.8
        hideMenuButtonWhenShow = true
        
        super.viewDidLoad()
        
        menuView.setContentView(contentView: MyMenu(delegate: self))
        setMenuButton(image: #imageLiteral(resourceName: "icMenu"))
        navigateToHome()
    }
    
    override func selectItemAt(indexPath: IndexPath) {
        switch indexPath.section {
        case 0:
            
            switch indexPath.row {
            case 0:
                navigateToHome()
                break
            case 1:
                navigateToProfile()
                break
            default:
                break
            }
            
            break
            
        case 1:
            
            switch indexPath.row {
            case 0:
                NSLog("Settings selected.")
                break
            case 1:
                NSLog("Options selected.")
                break
            default:
                break
            }
            
            break
        default:
            break
        }

        menuView.hide()
    }
    
    func navigateToHome() {
        let homeViewController = self.storyboard!.instantiateViewController(withIdentifier: "HomeViewController")
        self.pushViewController(homeViewController,
                                animated: true)
    }
    
    func navigateToProfile() {
        let profileViewController = self.storyboard!.instantiateViewController(withIdentifier: "ProfileViewController")
        self.pushViewController(profileViewController,
                                animated: true)
    }
}

extension HostViewController: MyMenuDelegate {
    func closeSession() {
        navigationController!.popViewController(animated: true)
    }
}
