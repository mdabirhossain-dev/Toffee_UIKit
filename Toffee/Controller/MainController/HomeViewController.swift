//
//  HomeViewController.swift
//  Toffee
//
//  Created by Md Abir Hossain on 14/1/24.
//

import UIKit

typealias MovieDataSource = UICollectionViewDiffableDataSource<MovieManager.Section, Movie>

class HomeViewController: UIViewController, UICollectionViewDelegate {
    
    static let headerID = "HeaderID"
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var pageControl: UIPageControl!
    
    // Carosel Cell Index
    var timer: Timer?
    var caroselCurrentCellIndex = 0
    var numberOfPages = 0
    var currentPage = 0
    
    private var caroselScrollIndex: ((_: IndexPath) -> Void)? = nil
    
    private var dataSource: MovieDataSource!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        collectionView.delegate = self
        self.pageControl.numberOfPages = 4
        
        setupView()
        
        pageControl.isHidden = true
    }
    
    private func setupView() {
        
        // Registering header/Title
        collectionView.register(TitleHeaderReusableView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: TitleHeaderReusableView.identifier)
        
        // Registering Carosel Cell
        collectionView.register(UINib(nibName: CaroselPagerCell.identifier, bundle: nil), forCellWithReuseIdentifier: CaroselPagerCell.identifier)
        
        // Registering Category Cell
        collectionView.register(UINib(nibName: CategoriesCell.identifier, bundle: nil), forCellWithReuseIdentifier: CategoriesCell.identifier)
        
        // Registering Moments Cell
        collectionView.register(UINib(nibName: MomentsCell.identifier, bundle: nil), forCellWithReuseIdentifier: MomentsCell.identifier)
        
        // Registering TidBits Cell
        collectionView.register(UINib(nibName: TidBitsCell.identifier, bundle: nil), forCellWithReuseIdentifier: TidBitsCell.identifier)
        
        // Registering Trending Cell
        collectionView.register(UINib(nibName: TrendingCell.identifier, bundle: nil), forCellWithReuseIdentifier: TrendingCell.identifier)
        
        // Registering Trending Cell
        collectionView.register(UINib(nibName: FeedCell.identifier, bundle: nil), forCellWithReuseIdentifier: FeedCell.identifier)
        
        // Configure CollectionView layout
        collectionView.collectionViewLayout = configureCollectionViewLayout()
        
        // Navigation Bar
        configureNavBar()
        
        // Configure DataSource
        configureDataSource()
        
        // Configure SnapShot
        configureSnapShot()
        
        // Configure PageVControl
        getPageControlSection()
    }
    
    
    // NavigationBar Configuration
    func configureNavBar() {
        //navigationController?.navigationBar.tintColor = .red
      let profileBarButton =  UIBarButtonItem(image: UIImage(systemName: "person.circle"), style: .done, target: self, action: nil)
        profileBarButton.tintColor = .label
        let notificationBarButton = UIBarButtonItem(image: UIImage(systemName: "bell.badge"), style: .done, target: self, action: nil)
        notificationBarButton.tintColor = .label
        let searchBarButton = UIBarButtonItem(image: UIImage(systemName: "magnifyingglass"), style: .done, target: self, action: nil)
        searchBarButton.tintColor = .label
        navigationItem.rightBarButtonItems = [profileBarButton, notificationBarButton, searchBarButton]
       let toffeeLogo = UIBarButtonItem(image: UIImage(named: "toffee-icon"), style: .plain, target: self, action: nil)
        
        navigationItem.leftBarButtonItems = [toffeeLogo]
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
                case 1:
                    section = self.getTVSection()
                case 2:
                    section = self.getCategoriesSection()
                case 3:
                    section = self.getMomentsSection()
                case 4:
                    section = self.getTidBitsSection()
                case 5:
                    section = self.getTrendingSection()
                case 6:
                    section = self.getFeedSection()
                default:
                    section = self.getCarosalSection()
            }
            
            return section
        }
        
        return UICollectionViewCompositionalLayout(sectionProvider: sectionProvider)
    }
    
    // Carosel scroll timer
    func startScrollTimer() {
        timer = Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(moveToNextIndex), userInfo: nil, repeats: true)
    }
    
    @objc func moveToNextIndex() {
        
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
        section.orthogonalScrollingBehavior = .paging
        section.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0)
        section.visibleItemsInvalidationHandler = { [weak self] visibleItems, point, environment in
                    let indexPath = visibleItems.last!.indexPath
                    self?.pageControl.currentPage = indexPath.row
        }
//        section.boundarySupplementaryItems = getHeader()
        
        return section
    }
    
    private func getPageControlSection() -> NSCollectionLayoutSection {
        // Create Item
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0)
        // Create group
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .absolute(50))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        
        // Create section
        let section = NSCollectionLayoutSection(group: group)
//        section.orthogonalScrollingBehavior = .groupPagingCentered
        section.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0)
        
        return section
    }
    
    private func getTVSection() -> NSCollectionLayoutSection {
        // Create Item
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0)
        
        // Create group
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.3), heightDimension: .fractionalHeight(0.2))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        
        // Create section
        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .continuous
        section.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0)
        
        section.boundarySupplementaryItems = getHeader()
        
        return section
    }
    
    private func getCategoriesSection() -> NSCollectionLayoutSection {
        
        let item = NSCollectionLayoutItem(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .absolute(265)))

        let group = NSCollectionLayoutGroup.horizontal(layoutSize: .init(widthDimension: .fractionalWidth(1/1.6), heightDimension: .absolute(265)), subitems: [item])

        // Create section
        let section = NSCollectionLayoutSection(group: group)
      
        section.boundarySupplementaryItems = [
            .init(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .absolute(50)), elementKind: CategoriesCell.identifier, alignment: .topLeading)
        ]
        section.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0)
        section.boundarySupplementaryItems = getHeader()
        section.orthogonalScrollingBehavior = .continuous
        
        return section
        
//        // Create Item
//        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1))
//        let item = NSCollectionLayoutItem(layoutSize: itemSize)
//        item.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0)
////        item.contentInsets.trailing = 10
//        
//        // Create group
//        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.5), heightDimension: .absolute(100))
//        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
////        group.contentInsets.leading = 15
//        
//        // Create section
//        let section = NSCollectionLayoutSection(group: group)
//        section.orthogonalScrollingBehavior = .continuous
//        section.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0)
//        
//        section.boundarySupplementaryItems = getHeader()
//        
//        return section
    }
    
    private func getMomentsSection() -> NSCollectionLayoutSection {
        
        let item = NSCollectionLayoutItem.init(layoutSize: .init(widthDimension: .absolute(100), heightDimension: .absolute(180)))
        item.contentInsets.trailing = 10
        
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: .init(widthDimension: .fractionalWidth(100), heightDimension: .absolute(180)), subitems: [item])
        group.contentInsets.leading = 5
        
        let section = NSCollectionLayoutSection(group: group)
        section.boundarySupplementaryItems = [
            .init(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .absolute(40)), elementKind: MomentsCell.identifier, alignment: .topLeading)
        ]
        
        // Create section
        section.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0)
        section.boundarySupplementaryItems = getHeader()
        section.orthogonalScrollingBehavior = .continuous
        
        return section
    }
    
    private func getTidBitsSection() -> NSCollectionLayoutSection {
        
        let item = NSCollectionLayoutItem.init(layoutSize: .init(widthDimension: .absolute(250), heightDimension: .absolute(80)))
        item.contentInsets.trailing = 10
        
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: .init(widthDimension: .fractionalWidth(250), heightDimension: .absolute(80)), subitems: [item])
        group.contentInsets.leading = 5
        
        let section = NSCollectionLayoutSection(group: group)
        section.boundarySupplementaryItems = [
            .init(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .absolute(40)), elementKind: TidBitsCell.identifier, alignment: .topLeading)
        ]
        
        // Create section
        section.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0)
        section.boundarySupplementaryItems = getHeader()
        section.orthogonalScrollingBehavior = .continuous
        
        return section
    }
    
    private func getTrendingSection() -> NSCollectionLayoutSection {
        
        let item = NSCollectionLayoutItem.init(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .absolute(220)))
        item.contentInsets.trailing = 10
        
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: .init(widthDimension: .fractionalWidth(1/3), heightDimension: .absolute(220)), subitems: [item])
        group.contentInsets.leading = 5
        
        let section = NSCollectionLayoutSection(group: group)
        section.boundarySupplementaryItems = [
            .init(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .absolute(40)), elementKind: TrendingCell.identifier, alignment: .topLeading)
        ]
        
        // Create section
        section.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0)
        section.boundarySupplementaryItems = getHeader()
        section.orthogonalScrollingBehavior = .continuous
        return section
    }
    
    private func getFeedSection() -> NSCollectionLayoutSection {
        
//        let item = NSCollectionLayoutItem.init(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .absolute(320)))
//        item.contentInsets.trailing = 10
//        
//        let group = NSCollectionLayoutGroup.vertical(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .absolute(320)), subitems: [item])
//        group.contentInsets.leading = 5
//        
//        let section = NSCollectionLayoutSection(group: group)
//        section.boundarySupplementaryItems = [
//            .init(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .absolute(40)), elementKind: FeedCell.identifier, alignment: .topLeading)
//        ]
//        
//        
//        // Create section
//        section.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0)
//        section.boundarySupplementaryItems = getHeader()
//        section.orthogonalScrollingBehavior = .continuous
//        return section
        
        let item = NSCollectionLayoutItem(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .absolute(350)))
        item.contentInsets.bottom = 20
        item.contentInsets.trailing = 2
        item.contentInsets.leading = 2
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .estimated(300)), subitems: [item])
        
        let section = NSCollectionLayoutSection(group: group)
        let x = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .absolute(40)), elementKind: FeedCell.identifier, alignment: .top, absoluteOffset: CGPoint(x: 0, y: -15))
        section.boundarySupplementaryItems = [
            x
        ]
        section.interGroupSpacing = 2.0
        x.pinToVisibleBounds = true
        section.boundarySupplementaryItems = getHeader()
        return section
    }
    
    private func getHeader() -> [NSCollectionLayoutBoundarySupplementaryItem] {
        let headerSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .estimated(44))
        let sectionHeader = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: headerSize, elementKind: UICollectionView.elementKindSectionHeader, alignment: .topLeading)
        
        return [sectionHeader]
    }
}


// MARK: - Diffable DataSource
extension HomeViewController {
    func configureDataSource() {
        dataSource = MovieDataSource(collectionView: collectionView) { (collectionView: UICollectionView, indexPath: IndexPath, movie: Movie) -> UICollectionViewCell? in
            let reuseIdentifier: String
            
            switch indexPath.section {
                case 0: reuseIdentifier = CaroselPagerCell.identifier
                case 1: reuseIdentifier = TVCell.identifier
                case 2: reuseIdentifier = CategoriesCell.identifier
                case 3: reuseIdentifier = MomentsCell.identifier
                case 4: reuseIdentifier = TidBitsCell.identifier
                case 5: reuseIdentifier = TrendingCell.identifier
                case 6: reuseIdentifier = FeedCell.identifier
                default: reuseIdentifier = CaroselPagerCell.identifier
            }
            
            switch indexPath.section {
                case 0:
                    // Carosel Cell
                    guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as? CaroselPagerCell else {
                        
                        return nil
                    }
                    let section = MovieManager.Section.allCases[indexPath.section]
//                    cell.showMovie(movie: MovieManager.movies[section]?[indexPath.item]) // fix
                    
                    print("cell index: \(indexPath.item)", "current - \(self.pageControl.currentPage)")
                    
                    self.caroselScrollIndex?(indexPath)
                    
                    return cell
                case 1:
                    // TV Cell
                    guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TVCell.identifier, for: indexPath) as? TVCell else {
                        return nil
                    }
                    
                    let section = MovieManager.Section.allCases[indexPath.section]
                    cell.showMovie(movie: MovieManager.movies[section]?[indexPath.item])
                    cell.image.image = UIImage(named: MovieManager.movies[section]?[indexPath.item].thumbnail ?? "person")
                    
                    return cell
                case 2:
                    // Carosel Cell
                    guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CategoriesCell.identifier, for: indexPath) as? CategoriesCell else {
                        return nil
                    }
                    
                    let section = MovieManager.Section.allCases[indexPath.section]
                    cell.showMovie(movie: MovieManager.movies[section]?[indexPath.item])
                    cell.categoryImage1.image = UIImage(named: MovieManager.movies[section]?[indexPath.item].thumbnail ?? "person")
                    cell.categoryImage2.image = UIImage(named: MovieManager.movies[section]?[indexPath.item].thumbnail ?? "person")
                    
                    return cell

                case 3:
                    // Moments Cell
                    guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MomentsCell.identifier, for: indexPath) as? MomentsCell else {
                        return nil
                    }
                    
                    let section = MovieManager.Section.allCases[indexPath.section]
                    cell.showMovie(movie: MovieManager.movies[section]?[indexPath.item])
                    cell.momentImage.image = UIImage(named: MovieManager.movies[section]?[indexPath.item].thumbnail ?? "person")
                    
                    return cell
                    
                case 4:
                    // TidBits Cell
                    guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TidBitsCell.identifier, for: indexPath) as? TidBitsCell else {
                        return nil
                    }
                    
                    let section = MovieManager.Section.allCases[indexPath.section]
                    cell.showMovie(movie: MovieManager.movies[section]?[indexPath.item])
                    cell.tidBitsImage.image = UIImage(named: MovieManager.movies[section]?[indexPath.item].thumbnail ?? "person")
                    
                    return cell
                    
                case 5:
                    // Trending Cell
                    guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TrendingCell.identifier, for: indexPath) as? TrendingCell else {
                        return nil
                    }
                    
                    let section = MovieManager.Section.allCases[indexPath.section]
                    cell.showMovie(movie: MovieManager.movies[section]?[indexPath.item])
                    cell.trendingImage.image = UIImage(named: MovieManager.movies[section]?[indexPath.item].thumbnail ?? "person")
                    cell.trendingTitle.text = MovieManager.movies[section]?[indexPath.item].title ?? "No Title"
                    
                    return cell
                case 6:
                    // Feed Cell
                    guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FeedCell.identifier, for: indexPath) as? FeedCell else {
                        return nil
                    }
                    
                    let section = MovieManager.Section.allCases[indexPath.section]
                    cell.showMovie(movie: MovieManager.movies[section]?[indexPath.item])
//                    cell.feedToffeeLogo.layer.cornerRadius = cell.feedToffeeLogo.frame.size.height / 2
//                    cell.feedToffeeLogo.layer.cornerRadius = 60
//                    cell.feedToffeeLogo.layer.masksToBounds = true
//                    cell.feedToffeeLogo.clipsToBounds = true
                    
                    return cell
                default:
                    // Carolsel Cell as Default
                    guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as? CaroselPagerCell else {
                        
                        return nil
                    }
                    let section = MovieManager.Section.allCases[indexPath.section]
//                    cell.showMovie(movie: MovieManager.movies[section]?[indexPath.item]) // fix
                    
                    print("cell index: \(indexPath.item)", "current - \(self.pageControl.currentPage)")
                    
                    self.caroselScrollIndex?(indexPath)
//                    guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as? CaroselCell else {
//                        
//                        return nil
//                    }
//                    
//                    let section = MovieManager.Section.allCases[indexPath.section]
//                    cell.showMovie(movie: MovieManager.movies[section]?[indexPath.item])
//                    cell.carosel.numberOfPages = MovieManager.movies[section]?.count ?? 0
//                    cell.carosel.currentPage = indexPath.row
                  //  self.pageControl.numberOfPages = (MovieManager.movies[section]?.count ?? 0) - 2
                    //self.pageControl.currentPage = indexPath.row
                    
                    return cell
            }
            
//            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as? MovieCell else {
//                
//                return nil
//            }
//            
//            let section = MovieManager.Section.allCases[indexPath.section]
//            cell.showMovie(movie: MovieManager.movies[section]?[indexPath.item])
//                        
//            return cell
        }
        
        dataSource.supplementaryViewProvider = {
            [ weak self] (
                collectionView: UICollectionView,
                kind: String,
                indexPath: IndexPath) -> UICollectionReusableView? in
            
            if let self = self, let headerSupplementaryView = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: TitleHeaderReusableView.identifier, for: indexPath) as? TitleHeaderReusableView {
                
                let section = self.dataSource.snapshot().sectionIdentifiers[indexPath.section]
                
                headerSupplementaryView.textLabel.text = section.rawValue
                
                return headerSupplementaryView
            }
            
            return nil
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

