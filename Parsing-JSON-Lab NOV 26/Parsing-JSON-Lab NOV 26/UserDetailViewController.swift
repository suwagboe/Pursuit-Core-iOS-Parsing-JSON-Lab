//
//  UserDetailViewController.swift
//  Parsing-JSON-Lab NOV 26
//
//  Created by World Domination a Brand on 12/5/19.
//  Copyright © 2019 Pursuitful stuff. All rights reserved.
//

import UIKit

class UserDetailViewController: UIViewController {
    
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var DOBLabel: UILabel!
    @IBOutlet weak var phoneNumber: UILabel!
    
    var selectedUser: User?{
        didSet{
            //   loadData()

        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
//selectedUser
    }


}
