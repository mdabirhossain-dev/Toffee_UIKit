//
//  CaroselCell.swift
//  Toffee
//
//  Created by Md Abir Hossain on 18/1/24.
//

import UIKit

class CaroselCell: UICollectionViewCell, MovieCell {
    static let identifier = String(describing: CaroselCell.self)
    
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var button: UIButton!
    
    func showMovie(movie: Movie?) {
        image.image = UIImage(named: movie?.thumbnail ?? "")
//        button.titleLabel?.text = movie?.title ?? ""
    }
    
    func movieCell(movie: Movie?) {
        
    }
}
