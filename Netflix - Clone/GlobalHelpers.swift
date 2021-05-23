//
//  GlobalHelpers.swift
//  Netflix - Clone
//
//  Created by Ali Mert Özhayta on 9.05.2021.
//

import SwiftUI

let exampleVideoURL = URL(string: "https://www.rmp-streaming.com/media/big-buck-bunny-720p.mp4")!

let exampleImageURL1 = URL(string: "https://picsum.photos/300/104")!
let exampleImageURL2 = URL(string: "https://picsum.photos/300/105")!
let exampleImageURL3 = URL(string: "https://picsum.photos/300/106")!

var randomExampleImageURL: URL {
    let url = "https://picsum.photos/300/1"
    let randomNumber = Int.random(in: 0..<30)
    
    if randomNumber < 10 {
        return URL(string: "\(url)0\(randomNumber)")!
    }
    return URL(string: "\(url)\(randomNumber)")!
}

let exampleTrailer1 = Trailer(name: "Season 3 Trailer", videoURL: exampleVideoURL, thumbnailImageURL: randomExampleImageURL)
let exampleTrailer2 = Trailer(name: "The Hero's Journey", videoURL: exampleVideoURL, thumbnailImageURL: randomExampleImageURL)
let exampleTrailer3 = Trailer(name: "The Mysterious", videoURL: exampleVideoURL, thumbnailImageURL: randomExampleImageURL)

let exampleTrailers = [exampleTrailer1, exampleTrailer2, exampleTrailer3]


let exampleMovie1 = Movie(
    id: UUID().uuidString,
    name: "DARK",
    thumbnnailURL: URL(string: "https://picsum.photos/200/300")!,
    categories: ["Dystopian", "Exiting", "Suspenseful", "Sci-Fi TV"],
    year: 2020, rating: "TV-MA",
    numberOfSeasons: 2,
    defaultEpisodeInfo: exampleEpisode1,
    creators: "Baran bo Odan, Jantje Friese",
    cast : "Louis Hofmann, Oliver Masucci, Jordis Triebel",
    moreLikeThisMovies: [exampleMovie2, exampleMovie3, exampleMovie4, exampleMovie5, exampleMovie6],
    episodes: allExampleEpisodes,
    promotionHeadline: "Watch Season 1 Now", trailers: exampleTrailers
)
let exampleMovie2 = Movie(
    id: UUID().uuidString,
    name: "Travelers",
    thumbnnailURL: URL(string: "https://picsum.photos/200/301")!,
    categories: ["Dystopian", "Exiting", "Suspenseful", "Sci-Fi TV"],
    year: 2020,
    rating: "TV-MA",
    numberOfSeasons: nil,
    defaultEpisodeInfo: exampleEpisode1,
    creators: "Baran bo Odan, Jantje Friese",
    cast : "Louis Hofmann, Oliver Masucci, Jordis Triebel",
    moreLikeThisMovies: [exampleMovie3, exampleMovie4, exampleMovie5, exampleMovie6],
    promotionHeadline: "Best Rated Show", trailers: exampleTrailers
)
let exampleMovie3 = Movie(
    id: UUID().uuidString,
    name: "Community",
    thumbnnailURL: URL(string: "https://picsum.photos/200/302")!,
    categories: ["Dystopian", "Exiting", "Suspenseful", "Sci-Fi TV"],
    year: 2020,
    rating: "TV-MA",
    numberOfSeasons: nil,
    defaultEpisodeInfo: exampleEpisode1,
    creators: "Baran bo Odan, Jantje Friese",
    cast : "Louis Hofmann, Oliver Masucci, Jordis Triebel",
    moreLikeThisMovies: [], trailers: exampleTrailers
)
let exampleMovie4 = Movie(
    id: UUID().uuidString, name: "Alone",
    thumbnnailURL: URL(string: "https://picsum.photos/200/303")!,
    categories: ["Dystopian", "Exiting", "Suspenseful", "Sci-Fi TV"],
    year: 2020, rating: "TV-MA",
    numberOfSeasons: nil,
    defaultEpisodeInfo: exampleEpisode1,
    creators: "Baran bo Odan, Jantje Friese",
    cast : "Louis Hofmann, Oliver Masucci, Jordis Triebel",
    moreLikeThisMovies: [],
    promotionHeadline: "New Episodes are coming soon", trailers: exampleTrailers
)
let exampleMovie5 = Movie(
    id: UUID().uuidString, name: "Hannibal",
    thumbnnailURL: URL(string: "https://picsum.photos/200/304")!,
    categories: ["Dystopian", "Exiting", "Suspenseful", "Sci-Fi TV"],
    year: 2020, rating: "TV-MA",
    numberOfSeasons: nil,
    defaultEpisodeInfo: exampleEpisode1,
    creators: "Baran bo Odan, Jantje Friese",
    cast : "Louis Hofmann, Oliver Masucci, Jordis Triebel",
    moreLikeThisMovies: [],
    promotionHeadline: "Watch Season 5 Now", trailers: exampleTrailers
)
let exampleMovie6 = Movie(
    id: UUID().uuidString,
    name: "After Life",
    thumbnnailURL: URL(string: "https://picsum.photos/200/305")!,
    categories: ["Dystopian", "Exiting", "Suspenseful", "Sci-Fi TV"],
    year: 2020, rating: "TV-MA",
    numberOfSeasons: nil,
    defaultEpisodeInfo: exampleEpisode1,
    creators: "Baran bo Odan, Jantje Friese",
    cast : "Louis Hofmann, Oliver Masucci, Jordis Triebel",
    moreLikeThisMovies: [], trailers: exampleTrailers
)


let exampleMovies : [Movie] = [exampleMovie1, exampleMovie2, exampleMovie3, exampleMovie4, exampleMovie5, exampleMovie6]

let exampleEpisodeInfo1 = EpisodeInfo(episodeName: "Beginnings and Endings", description: "Six months after the disappearances, the police from a task force. In 2052, Jonas learns that most of Winden perished in an apocalyptic event.", season: 2, episode: 1)


let exampleEpisode1 = Episode(name: "Beginnings and Endings", season: 1, episodeNumber: 1, thumbnailImageURLString: "https://picsum.photos/300/102", description: "Six months after the disappearances, the police from a task force. In 2052, Jonas learns that most of Winden perished in an apocalyptic event.", length: 53, videoURL: exampleVideoURL)

let exampleEpisode2 = Episode(name: "Dark Matter", season: 1, episodeNumber: 2, thumbnailImageURLString: "https://picsum.photos/300/103", description: "Clausen and Charlotte interview Regina. The Stranger takes Hannah to 1987, where Claudia has an unnerving encounter and Egon visits an old nemesis.", length: 54, videoURL: exampleVideoURL)

let exampleEpisode3 = Episode(name: "Ghosts", season: 1, episodeNumber: 3, thumbnailImageURLString: "https://picsum.photos/300/104", description: "In 1954, a missing Helge returns, but he'll only speak to Noah. In 1987, Claudia brings the time machine to Tannhaus, and Egon questions Ulrich again.", length: 56, videoURL: exampleVideoURL)

let exampleEpisode4 = Episode(name: "Beginnings and Endings", season: 2, episodeNumber: 1, thumbnailImageURLString: "https://picsum.photos/300/104", description: "Six months after the disappearances, the police from a task force. In 2052, Jonas learns that most of Winden perished in an apocalyptic event.", length: 53, videoURL: exampleVideoURL)

let exampleEpisode5 = Episode(name: "Dark Matter", season: 2, episodeNumber: 2, thumbnailImageURLString: "https://picsum.photos/300/105", description: "Clausen and Charlotte interview Regina. The Stranger takes Hannah to 1987, where Claudia has an unnerving encounter and Egon visits an old nemesis.", length: 54, videoURL: exampleVideoURL)

let exampleEpisode6 = Episode(name: "Ghosts", season: 2, episodeNumber: 3, thumbnailImageURLString: "https://picsum.photos/300/106", description: "In 1954, a missing Helge returns, but he'll only speak to Noah. In 1987, Claudia brings the time machine to Tannhaus, and Egon questions Ulrich again.", length: 56, videoURL: exampleVideoURL)

let allExampleEpisodes = [exampleEpisode1, exampleEpisode2, exampleEpisode3, exampleEpisode4, exampleEpisode5, exampleEpisode6]





extension LinearGradient {
    static let blackOpacityGradientFromCenter = LinearGradient(gradient: Gradient(colors: [Color.clear, Color.black.opacity(0.95)]), startPoint: .center, endPoint: .bottom)
    
    static let blackOpacityGradientFromCenterReverse = LinearGradient(gradient: Gradient(colors: [Color.clear, Color.black.opacity(0.95)]), startPoint: .bottom, endPoint: .center)

    static let blackOpacityGradientReverse = LinearGradient(gradient: Gradient(colors: [Color.black.opacity(0.95), Color.clear]), startPoint: .top, endPoint: .bottom)
   
    static let blackOpacityGradient = LinearGradient(gradient: Gradient(colors: [Color.black.opacity(0.95), Color.clear]), startPoint: .bottom, endPoint: .top)
}


extension String {
    func widthOfString(usingFont font: UIFont) -> CGFloat {
        let fontAttributes = [NSAttributedString.Key.font: font]
        let size = self.size(withAttributes: fontAttributes)
        return size.width
    }
    
    func capitalizeFirstLetter() -> String {
        return prefix(1).capitalized + dropFirst()
    }
    
    func addSpaceBeforeUppercaseLetter() -> String {
        let pattern = #"(?<=[a-z])(?=[A-Z])"#
        return self.replacingOccurrences(of: pattern, with: " ", options: .regularExpression)
    }
}
