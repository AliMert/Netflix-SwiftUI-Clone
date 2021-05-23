//
//  Episode.swift
//  Netflix - Clone
//
//  Created by Ali Mert Özhayta on 11.05.2021.
//

import Foundation

struct Episode : Identifiable {
    var id = UUID().uuidString

    var name : String
    var season : Int
    var episodeNumber: Int
    var thumbnailImageURLString : String
    var description: String
    var length : Int
    var videoURL: URL
    
    var thumbnailURL : URL {
        return URL(string: thumbnailImageURLString)!
    }
}

