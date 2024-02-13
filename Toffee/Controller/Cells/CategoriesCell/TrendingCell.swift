//
//  TrendingCell.swift
//  Toffee
//
//  Created by Md Abir Hossain on 4/2/24.
//

import UIKit

class TrendingCell: UICollectionViewCell, MovieCell {
    
    static let identifier = "TrendingCell"
    
    @IBOutlet weak var trendingImage: UIImageView!
    @IBOutlet weak var trendingTitle: UILabel!
    @IBOutlet weak var followButton: UIButton!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        followButton.layer.cornerRadius = 18
        followButton.layer.borderColor = UIColor.red.cgColor
        followButton.layer.borderWidth = 2
        followButton.clipsToBounds = true
        
        trendingImage.clipsToBounds = true
        trendingImage.layer.cornerRadius = trendingImage.bounds.height / 2
        
        followButton.isUserInteractionEnabled = true
    }
    
    @IBAction func followButtonPressed(_ sender: UIButton) {
        print("Follow button pressed.. \(trendingTitle.text ?? "No Channel Title")")
    }
    
    func showMovie(movie: Movie?) {
        trendingImage.image = UIImage(named: movie?.thumbnail ?? "person")
        trendingTitle.text = movie?.title ?? "No Title"
    }
}
