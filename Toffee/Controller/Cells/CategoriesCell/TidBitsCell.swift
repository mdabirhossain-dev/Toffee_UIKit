//
//  TidBitsCell.swift
//  Toffee
//
//  Created by Md Abir Hossain on 5/2/24.
//

import UIKit

class TidBitsCell: UICollectionViewCell, MovieCell {
    
    static let identifier = "TidBitsCell"
    
    @IBOutlet weak var tidBitsImage: UIImageView!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        
    }
    
    func showMovie(movie: Movie?) {
        tidBitsImage.image = UIImage(named: movie?.thumbnail ?? "person")
    }

}
