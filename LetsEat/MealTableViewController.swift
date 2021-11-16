//
//  MealTableViewController.swift
//  LetsEat
//
//  Created by Natalie on 11/15/21.
//

import UIKit

class MealTableViewController: UITableViewController {
    
    var mealList: [String] = []
    

    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return mealList.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
    cell.textLabel?.text = "\(mealList[indexPath.row])"
    print("\(mealList[indexPath.row])")

    return cell
}
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("\(mealList[indexPath.row])")
    }
}
