//
//  LetterCollectionViewCell.swift
//  LetsEat
//
//  Created by Natalie on 11/14/21.
//

import UIKit

class LetterCollectionViewCell: UICollectionViewCell {
    static let identifier = "LetterCollectionViewCell"
    
    var letterData: LetterListViewController.Letter? {
        didSet{
            guard let letterData = letterData else {
                return
            }
            label.text = letterData.name
        }
    }
    
    private let label: UILabel = {
        let label = UILabel()
        label.textColor = .salmon
        return label
        }()
    
    override init(frame: CGRect){
        super.init(frame: frame)
        contentView.addSubview(label)
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        label.frame = contentView.bounds
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        label.text = nil
    }
}
