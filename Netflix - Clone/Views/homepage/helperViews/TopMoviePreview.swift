//
//  TopMoviePreview.swift
//  Netflix - Clone
//
//  Created by Ali Mert Özhayta on 9.05.2021.
//

import SwiftUI
import Kingfisher

struct TopMoviePreview: View {
    
    @ObservedObject private var homeViewModel = HomeViewModel.shared
    @State private var isPresentPlayer: Bool = false
    @State private var isNavigate: Bool = false

    private var videoURL: URL {
        let movie = homeViewModel.topMovie
        let currentEpisode = movie.currentEpisodeInfo ?? movie.defaultEpisodeInfo
        return currentEpisode.videoURL
    }
    
    
    var body: some View {
        ZStack {
            NavigationLink(
                destination: MovieDetailView(movie: .constant(homeViewModel.topMovie)),
                isActive: $isNavigate) {
                EmptyView()
            }
            
            KFImage(homeViewModel.topMovie.thumbnnailURL)
                .renderingMode(.original)
                .resizable()
                .clipped()
                .scaledToFill()

            
            VStack {
                Spacer()
                HStack {
                    ForEach(homeViewModel.topMovie.categories, id: \.self) { category in
                        
                        HStack {
                            Text(category)
                                .font(.footnote)
                            if !Movie.isCategoryLast(movie:homeViewModel.topMovie, category) {
                            Image(systemName: "circle.fill")
                                .font(.system(size: 3))
                            }
                        }
                    }
                }.padding(.ArrayLiteralElement(arrayLiteral: .bottom, .leading, .trailing), 10)
                HStack {
                    Spacer()
                    SmallVerticalButton(text: "My List", isOnImage: "checkmark", isOffImage: "plus", isOn: false) {
                        //
                    }
                    Spacer()
                    PlayButton(text: "Play", imageName: "play.fill") {
                        isPresentPlayer = true
                    }
                    .frame(width: 120)
                    .sheet(isPresented: $isPresentPlayer, content: {VideoPlayerView(url: videoURL)})
                    
                    Spacer()

                    SmallVerticalButton(text: "Info", isOnImage: "info.circle", isOffImage: "info.circle", isOn: false) {
                        //
                    }
                    Spacer()

                }
                .padding(.ArrayLiteralElement(arrayLiteral: .bottom, .horizontal), 10)
            }
            .background(LinearGradient.blackOpacityGradientFromCenter)
            .onTapGesture {
                self.isNavigate = true
            }
            
        }
        .foregroundColor(.white)
    }
}

struct TopMoviePreview_Previews: PreviewProvider {
    static var previews: some View {
        TopMoviePreview()
    }
}
