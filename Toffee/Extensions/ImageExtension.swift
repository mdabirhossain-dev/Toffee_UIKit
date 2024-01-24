//
//  ImageExtension.swift
//  Toffee
//
//  Created by Md Abir Hossain on 24/1/24.
//

import UIKit

extension UIImageView {
    func makeRounded(borderColor: CGColor? = nil, borderWidth: CGFloat = 2) {
        layer.borderColor = borderColor
        layer.borderWidth = borderWidth
        layer.cornerRadius = frame.height / 2.2
        clipsToBounds = true
    }
    
    func addGradient() {
        
    }
}
