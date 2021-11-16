//
//  SearchViewController.swift
//  Let's Eat : A Recipe App
//
//  Created by Natalie on 11/10/21.
//

import UIKit

class SearchViewController: UIViewController, UISearchBarDelegate, UISearchResultsUpdating{

    private let searchController = UISearchController()
    private let nestedMealVC = MealTableViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .salmon
        title = "Search"
        searchController.searchResultsUpdater = self
        navigationItem.searchController = searchController
        view.addSubview(nestedMealVC.view)
        nestedMealVC.view.backgroundColor = .salmon
    
    }
    
    override func viewDidLayoutSubviews() {
        searchController.searchBar.sizeToFit()
        searchController.searchBar.clipsToBounds = true
        nestedMealVC.view.frame = CGRect(x: 0, y: searchController.searchBar.bottom, width: view.width, height: view.width)
    }
    
    func updateSearchResults(for searchController: UISearchController) {
        guard let text = searchController.searchBar.text else {
            return
        }
        for letter in text{
            if (text.count == 1){
                fetchLetterRecipes(with: "\(letter)")
            } else {
                var newMealList : [String] = []
                for meal in nestedMealVC.mealList{
                    if (meal.contains("\(text)")) {
                        newMealList.append(meal)
                    }
                }
                nestedMealVC.mealList = newMealList
                nestedMealVC.tableView.reloadData()
            }
        }
    }
    
    private func fetchLetterRecipes(with letter: String){
        let task = APICaller.shared.getSearchedData(with: "f=\(letter)", expecting: MealList.self){[weak self] result in
            DispatchQueue.main.async {
                switch result {
                case .success(let model):
                    self?.showMealList(with: model)
                case .failure(let error):
                    print(String(describing: error))
                    //MARK:  Need an error handler for examples such as X or Z, in which there is currently no recipes.
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
