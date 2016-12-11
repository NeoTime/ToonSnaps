//
//  SnapsViewController.swift
//  ToonSnaps
//
//  Created by Jefferey Rigler on 11/29/16.
//  Copyright © 2016 RiglerDigital. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase
import FirebaseAuth

class SnapsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var snaps : [Snap] = []
    
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
        
        FIRDatabase.database().reference().child("users").child(FIRAuth.auth()!.currentUser!.uid).child("snaps").observe(FIRDataEventType.childAdded, with: {(snapshot) in
            print(snapshot)
            
            
            
            let snap = Snap()
           
            
            guard snapshot.exists() else { return }
            let value = snapshot.value as! [String:AnyObject]
            snap.imageURL = value["imageURL"] as! String
            snap.from  = value["from"] as! String
            snap.descrip = value["description"] as! String
            
            
            self.snaps.append(snap)
            
            self.tableView.reloadData()
        })
        
        
}

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return snaps.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        
        let snap = snaps[indexPath.row]
        
        cell.textLabel?.text = snap.from

        
        return cell
    }
    
    @IBAction func logoutTapped(_ sender: Any) {
    dismiss(animated: true, completion: nil)
}


}




