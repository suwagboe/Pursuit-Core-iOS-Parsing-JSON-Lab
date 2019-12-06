//
//  RandomUserViewController.swift
//  Parsing-JSON-Lab NOV 26
//
//  Created by World Domination a Brand on 11/26/19.
//  Copyright © 2019 Pursuitful stuff. All rights reserved.
//

import UIKit

class RandomUserViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var randomUser = [User]() {
        didSet{
            tableView.reloadData()
        }
    }
    
//Display a list of at least 50 users showing their name and email address. Selecting a user should segue to a detailVC showing their full address, phone number, and date of birth.
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        loadData()
    }
    
    func loadData(){
        // this is where you need to assign the blank variable with data
        randomUser = RandomUser.getRandomUser()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let DVController = segue.destination as? UserDetailViewController, let indexPath = tableView.indexPathForSelectedRow else {
            fatalError("cannot access the details controller")
        }
        
        DVController.selectedUser = randomUser[indexPath.row]
    }

}

extension RandomUserViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       // randomUser.count
        return randomUser.count

    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "randomUserCell", for: indexPath)
                
       let selectedCell = randomUser[indexPath.row]
        
        let firstName = selectedCell.name.first
     let secondName = selectedCell.name.last
        
        let fullName = "\(firstName) \(secondName)"
        
        cell.textLabel?.text = fullName
        cell.detailTextLabel?.text = selectedCell.email

        
        return cell
        
    }
    
}
