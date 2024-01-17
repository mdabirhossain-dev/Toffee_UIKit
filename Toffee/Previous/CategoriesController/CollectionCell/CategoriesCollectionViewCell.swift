//
//  CategoriesCollectionViewCell.swift
//  Toffee
//
//  Created by Md Abir Hossain on 15/1/24.
//

import UIKit

class CategoriesCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var backgroundImageView: UIImageView!
    @IBOutlet var iconmageView: UIImageView!
    
    static let identifier = "CategoriesCollectionViewCell"
    
    static func nib() ->UINib {
        return UINib(nibName: "CategoriesCollectionViewCell", bundle: nil)
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        backgroundImageView.clipsToBounds = true
        backgroundImageView.layer.cornerRadius = 15
        backgroundImageView.backgroundColor = UIColor.systemGray2
    }
    
    public func configure(with categoryModel: CategoryModel) {
        self.titleLabel.text = categoryModel.title
        self.backgroundImageView.image = UIImage(named: categoryModel.backgroundImageName)
        self.iconmageView.image = UIImage(named: categoryModel.iconImageName)
    }
}
