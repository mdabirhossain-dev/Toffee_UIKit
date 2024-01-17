//
//  TVCollectionViewCell.swift
//  Toffee
//
//  Created by Md Abir Hossain on 14/1/24.
//

import UIKit

class TVCollectionViewCell: UICollectionViewCell {
    
//    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var imageView: UIImageView!
    
    static let identifier = "TVCollectionViewCell"
    
    static func nib() ->UINib {
        return UINib(nibName: "TVCollectionViewCell", bundle: nil)
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 30
        imageView.backgroundColor = UIColor.systemGray2
    }
    
    public func configure(with tvChannelModel: TVChannelModel) {
//        self.titleLabel.text = tvChannelModel.title
        self.imageView.image = UIImage(named: tvChannelModel.imageName)
    }

}
