//
//  MyMenu.swift
//  MenuController
//
//  Created by Leonardo Armero Barbosa on 4/5/17.
//  Copyright © 2017 Leonardo Armero Barbosa. All rights reserved.
//

import UIKit
import LABMenu

protocol MyMenuDelegate: LABMenuContainerDelegate {
    func closeSession()
}

class MyMenu: LABMenuContainer {
    
    fileprivate let sections: [String] = ["Main", "Options"]
    fileprivate let items: [[String]] = [["Home", "Profile"], ["Settings", "Options"]]
    
    @IBOutlet var view: UIView!
    @IBOutlet weak var icUser: UIImageView!
    @IBOutlet weak var icUserName: UILabel!
    
    var myMenuDelegate: MyMenuDelegate!
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init(delegate: MyMenuDelegate) {
        super.init(delegate: delegate)
        myMenuDelegate = delegate
        Bundle.main.loadNibNamed("MyMenu",
                                 owner: self,
                                 options: nil)
        self.frame.size = CGSize(width: UIScreen.main.bounds.width,
                                 height: UIScreen.main.bounds.height)
        self.view!.frame = CGRect(origin: CGPoint.zero,
                                  size: frame.size)
        self.addSubview(self.view!)
        
        self.delegate = delegate
    }
    
    @IBAction func closeSession(_ sender: Any) {
        myMenuDelegate.closeSession()
    }
}

extension MyMenu: UITableViewDataSource, UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items[section].count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sections[section]
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default,
                                   reuseIdentifier: nil)
        
        cell.textLabel!.text = items[indexPath.section][indexPath.row]
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        delegate.selectItemAt(indexPath: indexPath)
    }
}
