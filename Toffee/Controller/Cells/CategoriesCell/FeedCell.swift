//
//  FeedCell.swift
//  Toffee
//
//  Created by Md Abir Hossain on 5/2/24.
//

import UIKit

class FeedCell: UICollectionViewCell, MovieCell {
    
    static let identifier = "FeedCell"
    
    @IBOutlet weak var feedImage: UIImageView!
    @IBOutlet weak var feedToffeeLogo: UIImageView!
    @IBOutlet weak var feedTitle: UILabel!
    @IBOutlet weak var elipseButton: UIButton!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
//        feedToffeeLogo.layer.cornerRadius = 30
//        feedToffeeLogo.clipsToBounds = true
    }
    
//    override func layoutSubviews() {
//        
//        feedToffeeLogo.layoutIfNeeded()
//        feedToffeeLogo.layer.clipsToBounds = true
//        feedToffeeLogo.layer.masksToBounds = true
//        feedToffeeLogo.clipsToBounds = true
//        feedToffeeLogo.layer.cornerRadius = 30
//        
//        elipseButton.titleLabel?.text = "􀍠"
//        elipseButton.transform = CGAffineTransform(rotationAngle: CGFloat.pi / 2)
//    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        layoutIfNeeded()
        feedToffeeLogo.contentMode = .scaleAspectFit
        feedToffeeLogo.layer.cornerRadius = 20
        feedToffeeLogo.clipsToBounds = true
        
        elipseButton.titleLabel?.text = "􀍠"
        elipseButton.transform = CGAffineTransform(rotationAngle: CGFloat.pi / 2)
    }
    
    
    func showMovie(movie: Movie?) {
        feedImage.image = UIImage(named: movie?.thumbnail ?? "person")
        feedTitle.text = movie?.title ?? "No Title"
    }
    
}
