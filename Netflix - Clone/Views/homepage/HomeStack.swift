//
//  HomeStack.swift
//  Netflix - Clone
//
//  Created by Ali Mert Özhayta on 15.05.2021.
//

import SwiftUI

struct HomeStack: View {
    
    @Binding var topRowSelection: HomeTopRow
    @Binding var selectedGenre: HomeGenre
    @ObservedObject private var homeViewModel = HomeViewModel.shared
    
    var body: some View {
        ForEach(homeViewModel.allCategories, id: \.self ) { category in
            VStack {
                HStack {
                    Text(category.rawValue)
                        .font(.title3)
                        .bold()
                    Spacer()
                }
                
                ScrollView(.horizontal, showsIndicators: false) {
                    LazyHStack {
                        ForEach(homeViewModel.getMovies(byCategory: category, homeRowSelection: topRowSelection, genre: selectedGenre)) { movie in
                            
                            NavigationLink(
                                destination:
                                    MovieDetailView(movie: .constant(movie)),
                                label: {
                                
                                    StandardHomeMovie(movie: movie)
                                        .frame(width: 100, height: 200)
                                        .padding(.horizontal, 20)
                                })

                        }
                    }
                }
                .padding(.bottom, 15)
            }
        }
    }
}

struct HomeStack_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.black.edgesIgnoringSafeArea(.all)
            ScrollView(showsIndicators: false) {
                HomeStack(topRowSelection: .constant(.movies), selectedGenre: .constant(.AllGenres))
            }
        }
        .foregroundColor(.white)
    }
}
