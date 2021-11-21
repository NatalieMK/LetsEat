//
//  RecipeViewController.swift
//  Let's Eat : A Recipe App
//
//  Created by Natalie on 11/10/21.
//

import UIKit

class RecipeViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    private var validIngredients : Int = 0
    
    let recipeView: UICollectionView = UICollectionView(frame: .zero, collectionViewLayout: RecipeViewController.buildLayout())
    
    public var mealName: String = ""
    public var ingredients: [String?] = []
    public var measurements: [String?] = []
    public var instructions: String = ""
    
    struct RecipeData {
        var textLine: String
        var attributes: [NSAttributedString.Key: Any]
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .lavendar
        recipeView.dataSource = self
        recipeView.delegate = self
        recipeView.register(RecipeCollectionViewCell.self, forCellWithReuseIdentifier: RecipeCollectionViewCell.identifier)
        view.addSubview((recipeView))
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        recipeView.frame = view.bounds
    }
    
    static func buildLayout() -> UICollectionViewCompositionalLayout {
        return UICollectionViewCompositionalLayout {(section, env) -> NSCollectionLayoutSection? in
            var num = 0
            var top = CGFloat(0)
            var bottom = CGFloat(0)
            var leading = CGFloat(5)
            var trailing = CGFloat(5)
            var hDim = CGFloat()
            switch section{
            case 0:
                num = 1
                hDim = CGFloat(0.075)
                top = CGFloat(20)
                leading = CGFloat(50)
                trailing = CGFloat(50)
            case 1:
                num = 12
                top = CGFloat(10)
                hDim = CGFloat(0.35)
            case 2:
                top = CGFloat(10)
                bottom = CGFloat(10)
                num = 1
                hDim = CGFloat(2)
            default:
                num = 0
                hDim = CGFloat(0)
            }
            
        let titleItem = NSCollectionLayoutItem(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1)))
            titleItem.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 0, bottom: 0, trailing: 0)
            
        let titleGroup = NSCollectionLayoutGroup.vertical(
                layoutSize: NSCollectionLayoutSize(
                    widthDimension: .fractionalWidth(1),
                    heightDimension: .fractionalHeight(hDim)),
                    subitem: titleItem,
                    count: num)
            titleGroup.contentInsets = NSDirectionalEdgeInsets(top: top, leading: leading, bottom: bottom, trailing: trailing)
            
        let titleSection = NSCollectionLayoutSection(group: titleGroup)
            
        return titleSection
    }
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 1
        case 1:
            var count = 0
            for ingredient in ingredients {
                if (ingredient != "") {
                    count += 1
                }
            }
            print(count)
            return count
        case 2:
            return 1
        default:
            return 1
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = recipeView.dequeueReusableCell(withReuseIdentifier: RecipeCollectionViewCell.identifier, for: indexPath) as! RecipeCollectionViewCell
        switch indexPath.section {
        case 0:
            let attributes: [NSAttributedString.Key: Any] = [
                    .font: UIFont.boldSystemFont(ofSize: 20),
                    .foregroundColor: UIColor.black]
            cell.recipeData = RecipeData(textLine: mealName, attributes: attributes)
            return cell
        case 1:
            let attributes: [NSAttributedString.Key: Any] = [
                    .font: UIFont.boldSystemFont(ofSize: 15),
                    .foregroundColor: UIColor.lightGray]
            cell.recipeData = RecipeData(textLine: "\(measurements[indexPath.row]!) \(ingredients[indexPath.row]!)", attributes: attributes)
        case 2:
            let attributes: [NSAttributedString.Key: Any] = [
                    .font: UIFont.systemFont(ofSize: 15),
                    .foregroundColor: UIColor.darkGray]
            cell.recipeData = RecipeData(textLine: instructions, attributes: attributes)
        default:
            print("error")
            break
        }
        return cell
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 3
    }
    
}
