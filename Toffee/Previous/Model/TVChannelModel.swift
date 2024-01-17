//
//  TVChannelModel.swift
//  Toffee
//
//  Created by Md Abir Hossain on 14/1/24.
//

import Foundation


struct TVChannelModel {
    let title: String
    let imageName: String
    
    init(title: String, imageName: String) {
        self.title = title
        self.imageName = imageName
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
