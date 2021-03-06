//
//  LetterListViewController.swift
//  LetsEat
//
//  Created by Natalie on 11/14/21.
//

import UIKit

class LetterListViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    
    struct Letter {
    var name: String
    }
    
    public var mealList : [String] = []
    
    private let collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout()
    )
    // Nested View Controller
    private let nestedMealVC = MealTableViewController()
    
    private let alphabet = "abcdefghijklmnopqrstuvwxyz"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(LetterCollectionViewCell.self, forCellWithReuseIdentifier: LetterCollectionViewCell.identifier)

        view.addSubview(collectionView)
        view.addSubview(nestedMealVC.view)
        self.addChild(nestedMealVC)
        nestedMealVC.didMove(toParent: self)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        collectionView.frame = CGRect(x: 0, y: 0, width: view.width, height: (view.height/5))
        nestedMealVC.view.frame = CGRect(x: 0, y: collectionView.bottom, width: view.width, height: (view.height) - collectionView.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 26
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: LetterCollectionViewCell.identifier, for: indexPath) as! LetterCollectionViewCell
        let letterName = Array(alphabet)[indexPath.row]
        cell.letterData = Letter(name: "\(letterName)")
        cell.backgroundColor = .white
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: (view.width/13 - 13),
                      height: (view.width/13))
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let letter = Array(alphabet)[indexPath.row]
        fetchLetterRecipes(with: "\(letter)")
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
