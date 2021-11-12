//
//  ViewController.swift
//  Let's Eat : A Recipe App
//
//  Created by Natalie on 11/10/21.
//

import UIKit

class LetsEatViewController: UIViewController {
    
    private let categoryButton: UIButton = {
        let categoryButton = UIButton(frame: CGRect(x:100, y: 100, width: 200, height: 50))
        categoryButton.backgroundColor = .link
        categoryButton.setTitle("Select from Category", for: .normal)
        categoryButton.layer.cornerRadius = 12
        return categoryButton
    }()
    
    private let areaButton: UIButton = {
        let areaButton = UIButton(frame: CGRect(x:100, y: 100, width: 200, height: 50))
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
        view.backgroundColor = .white
        
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        if (UIApplication.isFirstLaunch()){
        welcomeUser()
        }
        view.addSubview(categoryButton)
        view.addSubview(searchButton)
}

private func welcomeUser(){
    let vc = WelcomeViewController()
    let nav = UINavigationController(rootViewController: vc)
    nav.modalPresentationStyle = .fullScreen
    present(nav, animated: false)
}
    
}
