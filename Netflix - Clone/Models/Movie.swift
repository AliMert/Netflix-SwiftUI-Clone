//
//  Movie.swift
//  Netflix - Clone
//
//  Created by Ali Mert Özhayta on 9.05.2021.
//

import Foundation

struct  Movie : Identifiable {
    var id : String
    var name : String
    var thumbnnailURL : URL
    var categories : [String]
    var genre: HomeGenre = .AllGenres
    
    // MovieDetailView
    var year : Int
    var rating : String
    var numberOfSeasons : Int?
    
    // Personalization
    var currentEpisodeInfo : Episode?
    
    var defaultEpisodeInfo : Episode
    var creators : String
    var cast : String

    var moreLikeThisMovies : [Movie]
    
    var episodes : [Episode]?
    
    var movieType : ContentType {
        return episodes == nil ? .movie : .tvShow
    }
    
    var promotionHeadline : String?
    
    var trailers: [Trailer]
    
    var numberOfSeasonsDisplay : String {
        if let seasons = numberOfSeasons {
            return seasons > 1 ? "\(seasons) seasons" : "\(seasons) season"
        }
        return ""
    }
    
    var seasonsArray : [String]? {
        if self.episodes == nil || self.numberOfSeasons == nil { return nil }
        
        var result : [String] = []
        for season in 1...(self.numberOfSeasons ?? 0) {
            result.append("Season \(season)")
        }
        return result
    }
    
    var episodeInfoDisplay : String {
        let episode = currentEpisodeInfo ?? defaultEpisodeInfo
        return "S\(episode.season):E\(episode.episodeNumber) \(episode.name)"
    }
    
    var episodeDescriptionDisplay : String {
        return (currentEpisodeInfo ?? defaultEpisodeInfo).description
    }
    
    static func getRandomMovie(homeRowSelection homeTopRowSelection: HomeTopRow, genre: HomeGenre = .AllGenres) -> Movie {
        switch homeTopRowSelection {
        case .home:
            return exampleMovies.randomElement() ?? exampleMovie1
        case .movies:
            if genre == .AllGenres {
                return exampleMovies.filter({$0.movieType == .movie}).randomElement() ?? exampleMovie1
            } else {
                return exampleMovies.filter({($0.movieType == .movie) && ($0.genre == genre)}).randomElement() ?? exampleMovie1
            }
        case .tvShows:
            if genre == .AllGenres {
                return exampleMovies.filter({$0.movieType == .tvShow}).randomElement() ?? exampleMovie1
            } else {
                return exampleMovies.filter({($0.movieType == .tvShow) && ($0.genre == genre)}).randomElement() ?? exampleMovie1
            }
        default:
            return  exampleMovie1
        }
    }
    
    static func isCategoryLast(movie: Movie, _ cat: String) -> Bool {
        
        let catCount = movie.categories.count
        if let index = movie.categories.firstIndex(of: cat) {
            return index + 1 == catCount
        }
        
        return true
    }
}

struct EpisodeInfo : Hashable, Equatable {
    var episodeName : String
    var description : String
    var season : Int
    var episode : Int

}

enum ContentType {
    case movie
    case tvShow
}

//struct IfMovie<Content>: View where Content : View {
//
//    var movie: Movie?
//    let content: () -> Content
//
//    init(movie: Movie?, @ViewBuilder _ content: @escaping () -> Content) {
//
//        self.movie = movie
//        self.content = content
//    }
//
//    var body: some View {
//        if self.movie != nil {
//            content()
//        }
//    }
//}
