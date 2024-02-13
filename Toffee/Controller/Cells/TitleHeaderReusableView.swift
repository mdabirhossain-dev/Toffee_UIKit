//
//  TitleHeaderReusableView.swift
//  Toffee
//
//  Created by Md Abir Hossain on 25/1/24.
//

import UIKit

class TitleHeaderReusableView: UICollectionReusableView {
    static let identifier = String(describing: TitleHeaderReusableView.self)
    
    let textLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        addSubview(textLabel)
        textLabel.font = UIFont.boldSystemFont(ofSize: 20)
        textLabel.textColor = .white
        textLabel.translatesAutoresizingMaskIntoConstraints = false
        
        let inset: CGFloat = 10
        
        NSLayoutConstraint.activate(
            [
                textLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: inset),
                textLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -inset),
                textLabel.topAnchor.constraint(equalTo: topAnchor, constant: inset),
                textLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -inset)
            ]
        )
    }
}

//class CaroselFooterReusableView: UICollectionReusableView {
//    static let identifier = String(describing: CaroselFooterReusableView.self)
//    
//    let pageControl = UIPageControl()
//    
//    override init(frame: CGRect) {
//        super.init(frame: frame)
//        
//        configure()
//    }
//    
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//    
//    private func configure() {
//        addSubview(pageControl)
//        pageControl.translatesAutoresizingMaskIntoConstraints = false
//        
//        let inset: CGFloat = 10
//        
//        NSLayoutConstraint.activate(
//            [
//                pageControl.leadingAnchor.constraint(equalTo: trailingAnchor, constant: -inset),
//                pageControl.trailingAnchor.constraint(equalTo: leadingAnchor, constant: inset),
//                pageControl.topAnchor.constraint(equalTo: topAnchor, constant: inset),
//                pageControl.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -inset)
//            ]
//        )
//    }
//}
