//
//  MealListViewController.swift
//  Let's Eat : A Recipe App
//
//  Created by Natalie on 11/10/21.

import UIKit

class MealListViewController: UIViewController{

    public var categoryChosen : String = ""
    private var mealList: [String] = []
    private let nestedMealVC = MealTableViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .lightBlue
        fetchMeals(with: categoryChosen)
        view.addSubview(nestedMealVC.view)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        // Layout for TableViewController View, frame height accounting for bottom nav bar.
        nestedMealVC.view.frame = CGRect(x: 0, y: view.height/6, width: view.width, height: view.height - (view.height/4 + 12))
    }
    
    private func fetchMeals(with category: String) {
        let task = APICaller.shared.getFilteredData(with: "c=\(category)", expecting: MealList.self) { [weak self] result in
            DispatchQueue.main.async {
                switch result {
                case .success(let model):
                    self?.showMealList(with: model)
                case .failure(let error):
                    print(String(describing: error))
                    self?.failedToFetch()
                }
            }
        }
    }
    
    private func showMealList(with model: MealList){
        nestedMealVC.mealList = nestedMealVC.populateMealList(with: model)
        nestedMealVC.tableView.reloadData()
    }
}
