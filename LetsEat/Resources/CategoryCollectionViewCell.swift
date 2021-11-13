//
//  CategoryCollectionViewCell.swift
//  LetsEat
//
//  Created by Natalie on 11/12/21.
//

import UIKit

class CategoryCollectionViewCell: UICollectionViewCell {
    
    
    static let identifier = "CategoryCollectionViewCell"
    
    private let label: UILabel = {
        let label = UILabel()
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
        contentView.backgroundColor = .lavendar
    }
    
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        let imageFrame = contentView.bounds
        
//        CGRect(x: contentView.left, y: contentView.top , width: contentView.width/4, height: contentView.height)
        
        imageView.frame = imageFrame
        
        
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        imageView.image = nil
        label.text = nil
    }
}
