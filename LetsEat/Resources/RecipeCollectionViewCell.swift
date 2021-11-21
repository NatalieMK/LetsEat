//
//  RecipeCollectionViewCell.swift
//  LetsEat
//
//  Created by Natalie on 11/19/21.
//

import UIKit

class RecipeCollectionViewCell: UICollectionViewCell {
    static let identifier = "RecipeCollectionViewCell"
    
    
    var recipeData: RecipeViewController.RecipeData? {
        didSet{
            guard let recipeData = recipeData else {
                return
            }
            label.attributedText = NSAttributedString(string: recipeData.textLine, attributes: recipeData.attributes)
        }
    }
    
    private let label : UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        return label
    }()
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        let labelFrame = CGRect(x: 0, y: contentView.top, width: contentView.width, height: contentView.height)
        label.frame = labelFrame
        label.sizeToFit()
        
    }
    override init(frame:CGRect){
        super.init(frame: frame)
        contentView.addSubview(label)
    }
    
}
