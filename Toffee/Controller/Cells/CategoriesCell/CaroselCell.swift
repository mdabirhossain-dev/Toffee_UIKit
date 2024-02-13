//
//  CaroselCell.swift
//  Toffee
//
//  Created by Md Abir Hossain on 12/2/24.
//

import UIKit

class CaroselCell: UICollectionViewCell, MovieCell {
    static let identifier = "CaroselCell"

    @IBOutlet weak var caroselImage: UIImageView!
    
    var movieImage: String = "ontojal" {
        didSet {
            caroselImage.image = UIImage(named: movieImage)
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func showMovie(movie: Movie?) {
        caroselImage.image = UIImage(named: movie?.thumbnail ?? "person")
    }
}


// FSPager
