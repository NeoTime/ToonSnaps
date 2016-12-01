//
//  SelectUserViewController.swift
//  ToonSnaps
//
//  Created by Jefferey Rigler on 12/1/16.
//  Copyright © 2016 RiglerDigital. All rights reserved.
//

import UIKit

class SelectUserViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    
    @IBOutlet weak var tableView: UITableView!
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.dataSource = self
        self.tableView.delegate = self
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        <#code#>
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        <#code#>
    }
    
    }
    

   


