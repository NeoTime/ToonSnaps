//
//  SelectUserViewController.swift
//  ToonSnaps
//
//  Created by Jefferey Rigler on 12/1/16.
//  Copyright © 2016 RiglerDigital. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase
import FirebaseAuth

class SelectUserViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    
    @IBOutlet weak var tableView: UITableView!
    
    var users : [User] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.dataSource = self
        self.tableView.delegate = self
        
        FIRDatabase.database().reference().child("users").observe(FIRDataEventType.childAdded, with: {(snapshot) in
            print(snapshot)
            
           
            
            let user = User()
            user.uid = snapshot.key
            
            guard snapshot.exists() else { return }
            let value = snapshot.value as! [String:AnyObject]
            user.email = value["email"] as! String
            
            self.users.append(user)
            
            self.tableView.reloadData()
        })
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        
        
        let user = users[indexPath.row]
        
        cell.textLabel?.text = user.email
        return cell
    }
    
}





