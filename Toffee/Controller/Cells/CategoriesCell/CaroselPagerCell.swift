//
//  CaroselPagerCell.swift
//  Toffee
//
//  Created by Md Abir Hossain on 13/2/24.
//

import UIKit


class CaroselPagerCell: UICollectionViewCell {
    static let identifier = "CaroselPagerCell"
    fileprivate let imageNames = ["ontojal","ural_prem","rishta","dirilis"]
    
    @IBOutlet private weak var pagerView: FSPagerView! {
        didSet {
            pagerView.register(FSPagerViewCell.self, forCellWithReuseIdentifier: "cell")
            pagerView.itemSize = FSPagerView.automaticSize
            pagerView.automaticSlidingInterval = 3.0 - pagerView.automaticSlidingInterval
//            self.pagerView.
            pageControl.setFillColor(.white, for: .normal)
            pageControl.setFillColor(UIColor(red: 127/255, green: 39/255, blue: 253/255, alpha: 1), for: .selected)
        }
    }
    
    @IBOutlet weak var pageControl: FSPageControl!{
        didSet {
            pageControl.numberOfPages = self.imageNames.count
            pageControl.contentHorizontalAlignment = .right
            pageControl.contentInsets = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        pagerView.delegate = self
        pagerView.dataSource = self
    }
}

extension CaroselPagerCell: FSPagerViewDataSource,FSPagerViewDelegate  {
    public func numberOfItems(in pagerView: FSPagerView) -> Int {
        return imageNames.count
    }
    
    public func pagerView(_ pagerView: FSPagerView, cellForItemAt index: Int) -> FSPagerViewCell {
        let cell = pagerView.dequeueReusableCell(withReuseIdentifier: "cell", at: index)
        cell.imageView?.image = UIImage(named: self.imageNames[index])
        cell.imageView?.contentMode = .scaleToFill
        cell.imageView?.clipsToBounds = true
        
        return cell
    }
    
    // MARK:- FSPagerView Delegate
    func pagerView(_ pagerView: FSPagerView, didSelectItemAt index: Int) {
        print(pagerView.currentIndex)
        pagerView.deselectItem(at: index, animated: true)
        pagerView.scrollToItem(at: index, animated: true)
        pagerView.isInfinite = true
    }
    
    func pagerViewWillEndDragging(_ pagerView: FSPagerView, targetIndex: Int) {
        pageControl.currentPage = targetIndex
    }
    
    func pagerViewDidEndScrollAnimation(_ pagerView: FSPagerView) {
        pageControl.currentPage = pagerView.currentIndex
    }

}

