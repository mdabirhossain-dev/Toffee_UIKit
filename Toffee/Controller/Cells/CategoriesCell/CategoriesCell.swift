//
//  CategoriesCell.swift
//  Toffee
//
//  Created by Md Abir Hossain on 28/1/24.
//

import UIKit

class CategoriesCell: UICollectionViewCell, MovieCell {
    
    static let identifier = "CategoriesCell"
    
    @IBOutlet weak var categoryImage1: UIImageView!
    @IBOutlet weak var categoryImage2: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        categoryImage1.layer.cornerRadius = 15
        categoryImage1.layer.cornerRadius = 15
        
    }
    
    func showMovie(movie: Movie?) {
        categoryImage1.image = UIImage(named: movie?.backgroundImage ?? "person")
        categoryImage2.image = UIImage(named: movie?.icon ?? "person")
    }
    
    
}
