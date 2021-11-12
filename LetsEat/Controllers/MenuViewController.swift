//
//  MenuViewController.swift
//  Let's Eat : A Recipe App
//
//  Created by Natalie on 11/10/21.
//

import UIKit

class MenuViewController: UIViewController {

    
    private let areaButton: UIButton = {
        let areaButton = UIButton(frame: CGRect(x:100, y: 300, width: 200, height: 50))
        areaButton.backgroundColor = .link
        areaButton.setTitle("Select from Area", for: .normal)
        areaButton.layer.cornerRadius = 12
        return areaButton
    }()
    
    private let searchButton: UIButton = {
        let searchButton = UIButton(frame: CGRect(x:100, y: 200, width: 200, height: 50))
        searchButton.backgroundColor = .link
        searchButton.layer.cornerRadius = 12
        searchButton.setTitle("Search for Meal", for: .normal)
        return searchButton
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .lavendar
        title = "Menu"
    }
    
    override func viewDidAppear(_ animated: Bool) {
 
                view.addSubview(areaButton)
                view.addSubview(searchButton)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
    }
    
    
}

