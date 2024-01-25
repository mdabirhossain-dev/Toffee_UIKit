//
//  MovieManager.swift
//  Toffee
//
//  Created by Md Abir Hossain on 18/1/24.
//

import Foundation

struct MovieManager {
    enum Section: String, CaseIterable {
        case Carosel = "Carosel"
        case PopularTVChannel = "Popular TV Channel"
        case Categories = "Categories"
        case TidBits = "TidBits"
        case EditorsChoice = "Editors Choice"
        case TrendingChannels = "Trending Channels"
    }
    
    static var movies = [
        Section.Carosel: [
            Movie(title: "Dirilis", thumbnail: "dirilis", backgroundImage: "", icon: ""),
            Movie(title: "Ontojal", thumbnail: "ontojal", backgroundImage: "", icon: ""),
            Movie(title: "Rishta", thumbnail: "rishta", backgroundImage: "", icon: ""),
            Movie(title: "Ural Prem", thumbnail: "ural_prem", backgroundImage: "", icon: "")
        ],
        Section.PopularTVChannel: [
            Movie(title: "Euro Sports", thumbnail: "euro_sports", backgroundImage: "", icon: ""),
            Movie(title: "Nick", thumbnail: "nick", backgroundImage: "", icon: ""),
            Movie(title: "Shomoy", thumbnail: "shomoy", backgroundImage: "", icon: ""),
            Movie(title: "Sony Aath", thumbnail: "sony_aath", backgroundImage: "", icon: ""),
            Movie(title: "Sony Sports1", thumbnail: "sony_sports1", backgroundImage: "", icon: ""),
            Movie(title: "Sony Sports2", thumbnail: "sony_sports2", backgroundImage: "", icon: ""),
            Movie(title: "Toffee Sports", thumbnail: "toffee_sports", backgroundImage: "", icon: ""),
            Movie(title: "Zee Bangla", thumbnail: "zee_bangla", backgroundImage: "", icon: "")
        ],
        Section.Categories: [
            Movie(title: "Dirilis", thumbnail: "dirilis", backgroundImage: "", icon: ""),
            Movie(title: "Ontojal", thumbnail: "ontojal", backgroundImage: "", icon: ""),
            Movie(title: "Rishta", thumbnail: "rishta", backgroundImage: "", icon: ""),
            Movie(title: "Ural Prem", thumbnail: "ural_prem", backgroundImage: "", icon: "")
//            Movie(title: "Drama", thumbnail: "", backgroundImage: "drama", icon: "drama_1"),
//            Movie(title: "Educational", thumbnail: "", backgroundImage: "educational", icon: "educational"),
//            Movie(title: "Food", thumbnail: "", backgroundImage: "food", icon: "food_1"),
//            Movie(title: "Kids", thumbnail: "", backgroundImage: "kids", icon: "kids_1"),
//            Movie(title: "Music", thumbnail: "", backgroundImage: "music", icon: "music_1"),
//            Movie(title: "Sports", thumbnail: "", backgroundImage: "sports", icon: "sports_1"),
//            Movie(title: "Web Series", thumbnail: "", backgroundImage: "web_series", icon: "web_series_1")
        ]
    ]
}


