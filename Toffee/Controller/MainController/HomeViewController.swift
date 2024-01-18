//
//  HomeViewController.swift
//  Toffee
//
//  Created by Md Abir Hossain on 14/1/24.
//

import UIKit

typealias MovieDataSource = UICollectionViewDiffableDataSource<MovieManager.Section, Movie>

class HomeViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    private var dataSource: MovieDataSource!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        setupView()
    }
    
    private func setupView() {
        
        setNavigationBarImage()
        
        // Configure CollectionView layout
        collectionView.collectionViewLayout = configureCollectionViewLayout()
        
        // Configure DataSource
        configureDataSource()
        
        // Configure SnapShot
        configureSnapShot()
    }
    
    private func setNavigationBarImage() {
        let toffeeLogo = UIImage(named: "toffee-icon")
        
        let imageView = UIImageView(image: toffeeLogo)
        imageView.contentMode = .scaleAspectFit
        
        self.navigationItem.titleView = imageView
        
    }
    
}

// MARK: - Collection View
extension HomeViewController {
    func configureCollectionViewLayout() -> UICollectionViewCompositionalLayout {
        let sectionProvider = { (sectionIndex: Int, layoutEnvironment: NSCollectionLayoutEnvironment) -> NSCollectionLayoutSection? in
            var section: NSCollectionLayoutSection?
            
            switch sectionIndex {
            case 0:
                section = self.getCarosalSection()
            default:
                section = self.getCarosalSection()
            }
            
            return section
        }
        
        return UICollectionViewCompositionalLayout(sectionProvider: sectionProvider)
    }
    
    private func getCarosalSection() -> NSCollectionLayoutSection {
        // Create Item
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0)
        // Create group
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(0.4))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        
        // Create section
        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .groupPagingCentered
        section.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0)
        
        return section
    }
}


// MARK: - Diffable DataSource
extension HomeViewController {
    func configureDataSource() {
        dataSource = MovieDataSource(collectionView: collectionView) { (collectionView: UICollectionView, indexPath: IndexPath, movie: Movie) -> UICollectionViewCell? in
            let reuseIdentifier: String = CaroselCell.identifier
            
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as? CaroselCell else {
                
                return nil
            }
            
            let section = MovieManager.Section.allCases[indexPath.section]
            cell.showMovie(movie: MovieManager.movies[section]?[indexPath.item])
            
            return cell
        }
    }
    
    func configureSnapShot() {
        var currentSnapshot = NSDiffableDataSourceSnapshot<MovieManager.Section, Movie> ()
        
        MovieManager.Section.allCases.forEach { collection in
            currentSnapshot.appendSections([collection])
            
            if let movies = MovieManager.movies[collection] {
                currentSnapshot.appendItems(movies)
            }
        }
        
        dataSource.apply(currentSnapshot, animatingDifferences: false)
    }
}








//class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
//
//    @IBOutlet var table: UITableView!
//
//    var tvChannelModel = [TVChannelModel]()
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        // Do any additional setup after loading the view.
//
//        tvChannelModel.append(TVChannelModel(title: "g", imageName: "euro_sports"))
//        tvChannelModel.append(TVChannelModel(title: "g", imageName: "nick"))
//        tvChannelModel.append(TVChannelModel(title: "g", imageName: "shomoy"))
//        tvChannelModel.append(TVChannelModel(title: "g", imageName: "sony_aath"))
//        tvChannelModel.append(TVChannelModel(title: "g", imageName: "sony_sports1"))
//        tvChannelModel.append(TVChannelModel(title: "g", imageName: "sony_sports2"))
//        tvChannelModel.append(TVChannelModel(title: "g", imageName: "toffee_sports"))
//        tvChannelModel.append(TVChannelModel(title: "g", imageName: "zee_bangla"))
//
//        table.register(CollectionTableViewCell.nib(), forCellReuseIdentifier: CollectionTableViewCell.identifier)
//        table.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
//        table.register(CategoriesTableViewCell.self, forCellReuseIdentifier: "CategoriesTableViewCell")
//        table.delegate = self
//        table.dataSource = self
//    }
//
//    // MARK: - Table
//    func numberOfSections(in tableView: UITableView) -> Int {
//        3
//    }
//
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//
//        return 1
//    }
//
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        if indexPath.section == 0 {
//            let cell = table.dequeueReusableCell(withIdentifier: CategoriesTableViewCell.identifier, for: indexPath) as! CategoriesTableViewCell
//
//            cell.configure()
//
//            return cell
//        }
//
//        return UITableViewCell()
//    }
//
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        return 150
//    }
//
//
//}

