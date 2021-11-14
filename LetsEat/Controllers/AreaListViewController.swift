//
//  AreaListViewController.swift
//  LetsEat
//
//  Created by Natalie on 11/13/21.
//

import UIKit

class AreaListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{
    

    public var areaList: [String] = []
    
    private let tableView = UITableView()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(areaList)
        view.backgroundColor = .lightBlue
        view.addSubview(tableView)
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.delegate = self
        tableView.dataSource = self
        self.tableView.backgroundColor = .white
    
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.frame = view.bounds
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = "\(areaList[indexPath.row])"
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return areaList.count
    }
    
}
