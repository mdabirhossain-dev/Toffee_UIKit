//
//  Movies.swift
//  Toffee
//
//  Created by Md Abir Hossain on 17/1/24.
//

import Foundation

struct Movie: Hashable {
    let id = UUID().uuidString
    let title: String
    let thumbnail: String?
    let backgroundImage: String? // Categories
    let icon: String? // Categories
    
    
    init(title: String, thumbnail: String?, backgroundImage: String?, icon: String) {
        self.title = title
        self.thumbnail = thumbnail
        self.backgroundImage = thumbnail
        self.icon = thumbnail
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
    static func == (lhs: Movie, rhs: Movie) -> Bool {
        return lhs.id == rhs.id
    }
}


//struct MovieFeedModel: Hashable {
//    let id = UUID().uuidString
//    let title: String
//    let thumbnail: String?
//    let backgroundImage: String? // Categories
//    let icon: String? // Categories
//    
//    
//    init(title: String, thumbnail: String?, backgroundImage: String?, icon: String) {
//        self.title = title
//        self.thumbnail = thumbnail
//        self.backgroundImage = thumbnail
//        self.icon = thumbnail
//    }
//    
//    func hash(into hasher: inout Hasher) {
//        hasher.combine(id)
//    }
//    
//    static func == (lhs: MovieCell, rhs: MovieCell) -> Bool {
//        return lhs.id == rhs.id
//    }
//}

