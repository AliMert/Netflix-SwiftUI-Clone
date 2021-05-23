//
//  HomeViewModel.swift
//  Netflix - Clone
//
//  Created by Ali Mert Özhayta on 9.05.2021.
//

import Foundation

class HomeViewModel: ObservableObject {
    
    static let shared = HomeViewModel()
    
    // String ==> Category
    @Published var movies : [ SectionType : [Movie] ] = [:]
    @Published var topMovie: Movie
    
    var allCategories : [SectionType]  {
        let keys = movies.keys.map({ String($0.rawValue) })
        return SectionType.getSectionArray(array: keys)
    }
    
    func getMovies(byCategory cat: SectionType, homeRowSelection homeTopRowSelection: HomeTopRow, genre: HomeGenre = .AllGenres) -> [Movie] {

        checkAndUpdateTopMovieIfNecessary(by: homeTopRowSelection, genre: genre)

        switch homeTopRowSelection {
        case .home:
            return movies[cat] ?? []
            
        case .movies:
            if genre == .AllGenres {
                return (movies[cat] ?? []).filter({ $0.movieType == .movie })
            } else {
            return (movies[cat] ?? []).filter({ ($0.movieType == .movie) && ($0.genre == genre) })
            }
        case .tvShows:
            if genre == .AllGenres {
                return (movies[cat] ?? []).filter({ $0.movieType == .tvShow })
            } else {
            return (movies[cat] ?? []).filter({ ($0.movieType == .tvShow) && ($0.genre == genre) })
            }
        case .myList:
            // TODO: Setup myList properly
            return movies[cat] ?? []
        }
    }
    
    init() {
        topMovie = Movie.getRandomMovie(homeRowSelection: .home, genre: .AllGenres)
        setupMovies()
    }
    
    func setupMovies() {
        movies[.trendingNow] = exampleMovies
        movies[.comedy] = exampleMovies.shuffled()
        movies[.newReleases] = exampleMovies.shuffled()
        movies[.watchItAgain] = exampleMovies.shuffled()
        movies[.sciFi] = exampleMovies.shuffled()
    }
    
    func checkAndUpdateTopMovieIfNecessary(by homeTopRowSelection: HomeTopRow, genre: HomeGenre) {
        var update = false
        
        switch topMovie.movieType {
            case  .movie:
                if homeTopRowSelection != .movies { update = true }
            case .tvShow:
                if homeTopRowSelection != .tvShows { update = true }
        }
        
        if homeTopRowSelection != .home && update {
            topMovie = Movie.getRandomMovie(homeRowSelection: homeTopRowSelection, genre: genre)
        }
    }
    
    func getTopMovie(by homeTopRowSelection: HomeTopRow, genre: HomeGenre) -> Movie {
        checkAndUpdateTopMovieIfNecessary(by: homeTopRowSelection, genre: genre)
        return topMovie
    }
    
}

enum SectionType : String, CaseIterable {
    case trendingNow = "Trending Now"
    case comedy = "Stand-Up Comedy"
    case newReleases = "New Releases"
    case watchItAgain = "Watch It Again"
    case sciFi = "Sci-Fi Movies"
    
    static func getSectionArray(array: [String]) -> [SectionType] {
        var sectionArray : [SectionType] = []
        for section in array {
            for sectionType in SectionType.allCases {
                if section == sectionType.rawValue {
                    sectionArray.append(sectionType)
                }
            }
        }
        return sectionArray
    }
}
