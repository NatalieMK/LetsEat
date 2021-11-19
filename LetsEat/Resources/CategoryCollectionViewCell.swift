//
//  CategoryCollectionViewCell.swift
//  LetsEat
//
//  Created by Natalie on 11/12/21.
//

import UIKit

class CategoryCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "CategoryCollectionViewCell"
    
    var categoryData: CategoryViewController.CategoryData? {
        didSet{
            guard let categoryData = categoryData else { return}
            imageView.image = categoryData.image
            label.text = categoryData.title
        }
    }
    
    private let label: UILabel = {
        let label = UILabel()
        label.textColor = .white
        var title = ""
        if (label.text == nil){
           title = "Error"
        } else{
            title = label.text!
        }
        let attributes: [NSAttributedString.Key: Any] = [
            .font: UIFont.boldSystemFont(ofSize: 22),
            .foregroundColor: UIColor.white]
        label.attributedText = NSAttributedString(string: title, attributes: attributes)
        return label
    }()
    
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        return imageView
    }()
    
    
    override init(frame: CGRect){
        super.init(frame: frame)
        contentView.layer.cornerRadius = 4
        contentView.backgroundColor = .lightBlue
        contentView.addSubview(imageView)
        contentView.addSubview(label)
    }
    
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        let imageFrame = CGRect(x: 0, y: 0, width: contentView.height/3, height: contentView.height/3)
        let labelFrame = CGRect(x: imageFrame.width/2, y: imageFrame.height, width: contentView.width - contentView.height/3, height: contentView.height/2)
        imageView.frame = imageFrame
        label.frame = labelFrame
    }

    override func prepareForReuse() {
        super.prepareForReuse()
        imageView.image = nil
        label.text = nil
    }
}
