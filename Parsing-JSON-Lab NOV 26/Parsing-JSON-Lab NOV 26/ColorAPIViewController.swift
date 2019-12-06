//
//  ViewController.swift
//  Parsing-JSON-Lab NOV 26
//
//  Created by World Domination a Brand on 11/26/19.
//  Copyright © 2019 Pursuitful stuff. All rights reserved.
//

import UIKit

class ColorAPIViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var allColors = [Color]() {
        didSet{
            tableView.reloadData()}
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        loadData()

    }


    func loadData() {
        allColors = Color.getColors()
    }
    
}

extension ColorAPIViewController: UITableViewDataSource {
 
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
         let cell = tableView.dequeueReusableCell(withIdentifier: "colorCell", for: indexPath)
              
        let color = allColors[indexPath.row]
              
        cell.textLabel?.text = color.name.value
        
          return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return allColors.count
    }
    
}
