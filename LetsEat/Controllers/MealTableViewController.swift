//
//  MealTableViewController.swift
//  LetsEat
//
//  Created by Natalie on 11/15/21.
//

import UIKit

class MealTableViewController: UITableViewController {
    
    var mealList: [String] = []
    let recipeVC = RecipeViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        print(self.parent)
    }
    
    override func viewDidLayoutSubviews() {
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return mealList.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
    cell.textLabel?.text = "\(mealList[indexPath.row])"

    return cell
}
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        fetchRecipe(with: "\(mealList[indexPath.row])")
    }
    
    
    private func fetchRecipe(with recipe: String){
        let task = APICaller.shared.getSearchedData(with: "s=\(recipe)", expecting: Recipes.self){ [weak self] result in
            DispatchQueue.main.async {
                switch result {
                case .success(let model):
                    print("success")
                    self?.loadRecipe(with: model.meals[0])
                    break
                case .failure(let error):
                    print(String(describing: error))
                    self?.failedToFetch()
                }
            }
        }
    }
    
   private func loadRecipe(with model: Recipe){
       recipeVC.mealName = model.strMeal
       recipeVC.instructions = model.strInstructions
       recipeVC.ingredients = [model.strIngredient1, model.strIngredient2, model.strIngredient3, model.strIngredient4, model.strIngredient5, model.strIngredient6, model.strIngredient7, model.strIngredient8, model.strIngredient9, model.strIngredient10, model.strIngredient11, model.strIngredient12]
       recipeVC.measurements = [model.strMeasure1, model.strMeasure2, model.strMeasure3, model.strMeasure4, model.strMeasure5, model.strMeasure6, model.strMeasure7, model.strMeasure8, model.strMeasure9, model.strMeasure10, model.strMeasure11, model.strMeasure12]
       parent?.tabBarController?.viewControllers![3] = recipeVC
       updateRecipeTab()
   }
    
    private func updateRecipeTab(){
        print(parent)
        parent?.tabBarController?.viewControllers![3].title = "Recipe"
        parent?.tabBarController?.viewControllers![3].tabBarItem.image = UIImage(systemName: "scroll")
        parent?.navigationController?.tabBarController?.selectedIndex = 3
        self.removeFromParent()
    }
    
}
