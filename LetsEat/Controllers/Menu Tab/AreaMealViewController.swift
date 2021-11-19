//
//  AreaMealViewController.swift
//  LetsEat
//
//  Created by Natalie on 11/15/21.
//

import UIKit

class AreaMealViewController: UIViewController {

    var areaChosen: String = ""
    var mealList: [String] = []
    let nestedMealVC = MealTableViewController()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(nestedMealVC.view)
        self.addChild(nestedMealVC)
        nestedMealVC.didMove(toParent: presentingViewController)
        fetchMeals(with: areaChosen)
        view.backgroundColor = .lightBlue
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        nestedMealVC.view.frame = view.bounds
    }
    
    private func fetchMeals(with category: String) {
        let task = APICaller.shared.getFilteredData(with: "a=\(category)", expecting: MealList.self) { [weak self] result in
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
