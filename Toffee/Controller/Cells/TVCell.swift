//
//  TVCell.swift
//  Toffee
//
//  Created by Md Abir Hossain on 23/1/24.
//

import UIKit

class TVCell: UICollectionViewCell, MovieCell {
    
    static let identifier = String(describing: TVCell.self)
    
    @IBOutlet weak var image: UIImageView!
    
    func showMovie(movie: Movie?) {
        image.makeRounded(borderColor: (UIColor.systemGray6.cgColor))
        image.image = UIImage(named: movie?.thumbnail ?? "")
    }
    
    func movieCell(movie: Movie?) {
        contentView.backgroundColor = .red
    }
}
