//
//  MovieManager.swift
//  Toffee
//
//  Created by Md Abir Hossain on 18/1/24.
//

import Foundation

struct MovieManager {
    enum Section: String, CaseIterable {
        case Carosel = "" // "Carosel"
        case PopularTVChannel = "Popular TV Channel"
        case Categories = "Categories"
        case Moments = "Moments"
        case TidBits = "TidBits"
        case TrendingChannels = "Trending Channels"
//        case EditorsChoice = "Editors Choice"
        case Feed = "Feed"
    }
    
    static var movies = [
        Section.Carosel: [
            Movie(title: "Ontojal", thumbnail: "ontojal", backgroundImage: "", icon: ""),
            Movie(title: "Ural Prem", thumbnail: "ural_prem", backgroundImage: "", icon: ""),
            Movie(title: "Rishta", thumbnail: "rishta", backgroundImage: "", icon: ""),
            Movie(title: "Dirilis", thumbnail: "dirilis", backgroundImage: "", icon: "")
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
            Movie(title: "Dirilis", thumbnail: "educational", backgroundImage: "", icon: ""),
            Movie(title: "Ontojal", thumbnail: "drama", backgroundImage: "", icon: ""),
            Movie(title: "Rishta", thumbnail: "food", backgroundImage: "", icon: ""),
            Movie(title: "Rishta", thumbnail: "kids", backgroundImage: "", icon: ""),
            Movie(title: "Rishta", thumbnail: "music", backgroundImage: "", icon: ""),
            Movie(title: "Rishta", thumbnail: "sports", backgroundImage: "", icon: ""),
            Movie(title: "Ural Prem", thumbnail: "web_series", backgroundImage: "", icon: "")
        ],
        Section.Moments: [
            Movie(title: "Dirilis", thumbnail: "monents0", backgroundImage: "", icon: ""),
            Movie(title: "Dirilis", thumbnail: "monents1", backgroundImage: "", icon: ""),
            Movie(title: "Dirilis", thumbnail: "monents2", backgroundImage: "", icon: ""),
            Movie(title: "Dirilis", thumbnail: "monents5", backgroundImage: "", icon: ""),
            Movie(title: "Dirilis", thumbnail: "monents6", backgroundImage: "", icon: ""),
            Movie(title: "Dirilis", thumbnail: "monents7", backgroundImage: "", icon: "")
        ],
        Section.TidBits: [
            Movie(title: "", thumbnail: "food", backgroundImage: "", icon: ""),
            Movie(title: "", thumbnail: "kids", backgroundImage: "", icon: ""),
            Movie(title: "", thumbnail: "music", backgroundImage: "", icon: "")
        ],
        Section.TrendingChannels: [
            Movie(title: "Bangla", thumbnail: "bangla", backgroundImage: "", icon: ""),
            Movie(title: "Bangladesh Food Review", thumbnail: "bangladesh_food_reviewer", backgroundImage: "", icon: ""),
            Movie(title: "BD Cric Time", thumbnail: "bd_cric_time", backgroundImage: "", icon: ""),
            Movie(title: "Khela 71", thumbnail: "khela_71", backgroundImage: "", icon: ""),
            Movie(title: "Maasranga", thumbnail: "maasranga", backgroundImage: "", icon: ""),
            Movie(title: "MK Production", thumbnail: "mk_production", backgroundImage: "", icon: ""),
            Movie(title: "Sports Analytica", thumbnail: "orts_analytica", backgroundImage: "", icon: ""),
            Movie(title: "Shafin Ahmed", thumbnail: "shafin_ahmed", backgroundImage: "", icon: "")
        ],
        Section.Feed: [
            Movie(title: "Bangla", thumbnail: "briefcase", backgroundImage: "", icon: ""),
            Movie(title: "Bangladesh Food Review", thumbnail: "dear_villain", backgroundImage: "", icon: ""),
            Movie(title: "BD Cric Time", thumbnail: "hawai_mithai", backgroundImage: "", icon: ""),
            Movie(title: "Khela 71", thumbnail: "hothat_brishti", backgroundImage: "", icon: ""),
            Movie(title: "Maasranga", thumbnail: "sesh_judho", backgroundImage: "", icon: "")
        ],
    ]
}


