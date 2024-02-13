//
//  MomentsCell.swift
//  Toffee
//
//  Created by Md Abir Hossain on 4/2/24.
//

import UIKit

class MomentsCell: UICollectionViewCell, MovieCell {
    static let identifier = "MomentsCell"
    
    @IBOutlet weak var momentImage: UIImageView!
    @IBOutlet weak var playButton: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        momentImage.clipsToBounds = true
        momentImage.layer.cornerRadius = 10
        
        playButton.tintColor = UIColor.white
        
    }
    
    func showMovie(movie: Movie?) {
        momentImage.image = UIImage(named: movie?.thumbnail ?? "person")
    }
    
    
    
}
