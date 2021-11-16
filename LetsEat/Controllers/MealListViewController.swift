//
//  MealListViewController.swift
//  Let's Eat : A Recipe App
//
//  Created by Natalie on 11/10/21.
//

import UIKit

class MealListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{

    public var categoryChosen : String = ""
    
    private var mealList: [String] = []
    
    private let tableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .lightBlue
        fetchMeals(with: categoryChosen)
        print(mealList)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        view.addSubview(tableView)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.frame = view.bounds
    }
    
    private func fetchMeals(with category: String) {
        let task = APICaller.shared.getFilteredData(with: "c=\(category)", expecting: MealList.self) { [weak self] result in
            DispatchQueue.main.async {
                switch result {
                case .success(let model):
                    self?.showMealList(with: model)
                    print("success")
                case .failure(let error):
                    print(String(describing: error))
                    self?.failedToFetch()
                }
            }
        }
    }
    
    private func showMealList(with model: MealList){
        let meals = model.meals
        var categorizedList = [String]()
        for meal in meals{
            categorizedList.append(meal.strMeal)
        }
        mealList = categorizedList
        tableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return mealList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = "\(mealList[indexPath.row])"
        print("\(mealList[indexPath.row])")
        return cell
    }

}
