//
//  StandardHomeMovie.swift
//  Netflix - Clone
//
//  Created by Ali Mert Özhayta on 9.05.2021.
//

import SwiftUI
import Kingfisher

struct StandardHomeMovie: View {
    var movie: Movie
    var body: some View {
        KFImage(movie.thumbnnailURL)
            .resizable()
            .scaledToFill()
            .cornerRadius(5)
            
    }
}

struct StandardHomeMovie_Previews: PreviewProvider {
    static var previews: some View {
        StandardHomeMovie(movie: exampleMovie1)
          //  .frame(width: 200, height: 300, alignment: .center)
    }
}
