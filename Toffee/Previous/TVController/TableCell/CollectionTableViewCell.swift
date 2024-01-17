//
//  CollectionTableViewCell.swift
//  Toffee
//
//  Created by Md Abir Hossain on 14/1/24.
//

import UIKit

class CollectionTableViewCell: UITableViewCell, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    static let identifier = "CollectionTableViewCell"
    
    static func nib() -> UINib {
        
        return UINib(nibName: "CollectionTableViewCell", bundle: nil)
    }
    
    func configure(with tvChannelModel: [TVChannelModel]) {
        self.tvChannelModel = tvChannelModel
        
        collectionView.reloadData()
    }
    
    @IBOutlet var collectionView: UICollectionView!
    
    var tvChannelModel = [TVChannelModel]()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        collectionView.register(TVCollectionViewCell.nib(), forCellWithReuseIdentifier: TVCollectionViewCell.identifier)
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
        
    }
    
    // MARK: - CollectionView
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return tvChannelModel.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TVCollectionViewCell.identifier, for: indexPath) as! TVCollectionViewCell
        cell.configure(with: tvChannelModel[indexPath.row])
//        cell.imageView.layer.cornerRadius = 40
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexpath: IndexPath) -> CGSize {
        
        return CGSize(width: 100, height: 100)
    }
    
    
}
