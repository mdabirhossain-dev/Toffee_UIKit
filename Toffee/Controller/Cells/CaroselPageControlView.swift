//
//  CaroselPageControlView.swift
//  Toffee
//
//  Created by Md Abir Hossain on 7/2/24.
//

import UIKit

class CaroselPageControlView: UICollectionViewCell {
    
    static let identifier = String(describing: CaroselPageControlView.self)
    
    @IBOutlet weak var pageControl: UIPageControl!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        pageControl.currentPage = 0
        
    }
    
    func setupFunction(indexPath: IndexPath, count: Int) {
        pageControl.numberOfPages = count
        pageControl.currentPage = indexPath.item
    }

}
