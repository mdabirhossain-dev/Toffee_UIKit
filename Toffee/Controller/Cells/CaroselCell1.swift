//
//  CaroselCell.swift
//  Toffee
//
//  Created by Md Abir Hossain on 18/1/24.
//

import UIKit

class CaroselCell1: UICollectionViewCell, MovieCell {
    static let identifier = "CaroselCell1"
    
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var button: UIButton!
    @IBOutlet weak var carosel: UIPageControl!
    
    func showMovie(movie: Movie?) {
        image.image = UIImage(named: movie?.thumbnail ?? "")
//        button.titleLabel?.text = movie?.title ?? ""
    }
    
//    func movieCell(movie: Movie?) {
//        
//    }
}
