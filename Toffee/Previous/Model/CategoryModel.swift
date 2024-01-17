//
//  CategoryModel.swift
//  Toffee
//
//  Created by Md Abir Hossain on 16/1/24.
//

import Foundation


struct CategoryModel {
    let title: String
    let backgroundImageName: String
    let iconImageName: String
    
    init(title: String, backgroundImageName: String, iconImageName: String) {
        self.title = title
        self.backgroundImageName = backgroundImageName
        self.iconImageName = iconImageName
    }
}


var categoryModel: [CategoryModel] = [
    CategoryModel(title: "Sports", backgroundImageName: "drama", iconImageName: "drama"),
    CategoryModel(title: "Web Series", backgroundImageName: "educational", iconImageName: "educational"),
    CategoryModel(title: "Movies", backgroundImageName: "food", iconImageName: "food"),
    CategoryModel(title: "Drama", backgroundImageName: "kids", iconImageName: "kids"),
    CategoryModel(title: "Music Videos", backgroundImageName: "music", iconImageName: "music"),
    CategoryModel(title: "Food", backgroundImageName: "sports", iconImageName: "sports"),
    CategoryModel(title: "Educational", backgroundImageName: "web_series", iconImageName: "web_series")
]

