//
//  MoreLikeThisView.swift
//  Netflix - Clone
//
//  Created by Ali Mert Özhayta on 13.05.2021.
//

import SwiftUI

struct MoreLikeThisView: View {
    
    var movies : [Movie]
    
    let colums = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    var body: some View {

        LazyVGrid(columns: colums) {
            ForEach(0..<movies.count) { index in
                StandardHomeMovie(movie: movies[index])
            }
        }              
            
    }
}

struct MoreLikeThisView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.black
                .edgesIgnoringSafeArea(.all)
            MoreLikeThisView(movies: exampleMovies)
        }
    }
}
