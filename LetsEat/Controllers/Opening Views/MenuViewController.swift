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
        areaButton.addTarget(self, action: #selector(areaButtonTapped), for: .touchUpInside)
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
    @objc func areaButtonTapped(){
        fetchAreas()
    }
    
    private func fetchAreas(){
        let task = APICaller.shared.getListData(with: "a=list", expecting: AreaList.self){ [weak self] result in
            DispatchQueue.main.async {
                switch result {
                case .success(let model):
                    self?.updateUI(with: model)
                    break
                case .failure(let error):
                    print(error.localizedDescription)
                    self?.failedToFetch()
                    
                }
            }
        }
    }
    
    private func failedToFetch(){
        print("Something went wrong")
    }
    
    private func updateUI(with model: AreaList){
        
        let areas = model.meals
        var areaList = [String]()
        
        for area in areas{
            areaList.append(area.strArea)
            print(area.strArea)
        }
        
        let vc = AreaListViewController()
        vc.areaList = areaList
        print(areaList)
        let nav = UINavigationController(rootViewController: vc)
        nav.modalPresentationStyle = .fullScreen
        present(nav, animated: true)
//        switch models{
//        case .areaList(let AreaList):
//            var areas = AreaList.meals
//            print(areas)
//        case .mealList(let MealList):
//            break
//        case .recipeList(let RecipeList):
//            break
            
//        default :
//            break
//    }
}
    
}

