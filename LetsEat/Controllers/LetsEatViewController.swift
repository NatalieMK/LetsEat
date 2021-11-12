//
//  ViewController.swift
//  Let's Eat : A Recipe App
//
//  Created by Natalie on 11/10/21.
//

import UIKit

class LetsEatViewController: UIViewController {
    
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
        loadTabBar()
    }


private func welcomeUser(){
    let vc = WelcomeViewController()
    let nav = UINavigationController(rootViewController: vc)
    nav.modalPresentationStyle = .fullScreen
    present(nav, animated: false)
}
    
    private func loadTabBar(){
        let tabBarVC = UITabBarController()
        let catVC = UINavigationController(rootViewController: CategoryViewController())
        let menuVC = UINavigationController(rootViewController: MenuViewController())
        let searchVC = UINavigationController(rootViewController:  SearchViewController())
        let recipeVC = UINavigationController(rootViewController: RecipeViewController())
        
        catVC.title = "Categories"
        menuVC.title = "Menu"
        searchVC.title = "Search"
        recipeVC.title = "Recipe"
        
        catVC.tabBarItem.image = UIImage(systemName: "folder")
        menuVC.tabBarItem.image = UIImage(systemName: "fork.knife.circle")
        searchVC.tabBarItem.image = UIImage(systemName: "magnifyingglass")
        recipeVC.tabBarItem.image = UIImage(systemName: "scroll")
        
        tabBarVC.setViewControllers([menuVC, catVC, searchVC, recipeVC], animated: false)
        tabBarVC.modalPresentationStyle = .fullScreen
        present(tabBarVC, animated: false)
    }
    
}
