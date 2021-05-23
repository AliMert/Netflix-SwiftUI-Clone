//
//  MovieDetailView.swift
//  Netflix - Clone
//
//  Created by Ali Mert Özhayta on 11.05.2021.
//

import SwiftUI

struct ifMovie: View {
    var closure : () -> Void
    var body: some View {
        VStack {
            Text("HI")
        }
    }
}

struct MovieDetailView: View {
    
    @Binding var movie: Movie?
    //var movie : Movie
    let screen = UIScreen.main.bounds 

    @State private var showSeasonPicker = false
    @State private var selectedSeasonIndex = 0
    @State private var blurAmount: CGFloat = 0
    
    
//    func ifMovie(closure: ()->View) -> View {
//        if movie != nil {
//            return closure()
//        }
//    }
    

    
    var body: some View {
        ZStack {
            Color.black
                .edgesIgnoringSafeArea(.all)
            
            VStack {
//                HStack {
//                    Spacer()
//                    Button(action: {
//                        // close the view
//                        movie = nil
//
//                    }, label: {
//                        Image(systemName: "xmark.circle")
//                            .font(.system(size: 28))
//                    })
//                }
//                .padding(.horizontal, 22)
                
                ScrollView(.vertical, showsIndicators: false) {
                    VStack {
                        if let mov = movie {
                            
                            VideoPreviewImageView(imageURL: mov.trailers.randomElement()?.thumbnailImageURL ?? URL(string: "")!, videoURL:
                                                    mov.trailers.randomElement()?.videoURL ?? URL(string: "")!)
                                .frame(width: screen.width)

                            HStack {
                                MovieInfoSubheadline(movie: mov)
                                    .padding(.bottom, 10)
                                Spacer()
                            }
                            
                            if let headline = mov.promotionHeadline {
                                Text(headline)
                                    .bold()
                                    .font(.headline)
                            }
                            
                            PlayButton(text: "Play", imageName: "play.fill", backgroundColor: .white) {
                                // play video
                            }
                            PlayButton(text: "Download", imageName: "arrow.down.to.line.alt", backgroundColor: .gray) {
                                // play video
                            }
                            
                            // Current Episode Information
                            EpisodeInfoView(movie: mov)
                            
                            CastInfoView(movie: mov)
                            
                            HStack(spacing: 60) {
                                SmallVerticalButton(text: "My List", isOnImage: "checkmark", isOffImage: "plus", isOn: true, textSize: 12, textColor: .gray) {
                                    //
                                }
                                SmallVerticalButton(text: "Rate", isOnImage: "hand.thumbsup.fill", isOffImage: "hand.thumbsup", isOn: true, textSize: 12, textColor: .gray) {
                                    //
                                }
                                SmallVerticalButton(text: "Share", isOnImage: "paperplane.fill", isOffImage: "paperplane.fill", isOn: true, textSize: 12, textColor: .gray) {
                                    //
                                }
                                Spacer()
                            }
                            .padding(.leading, 20)
                            
                            
                            CustomTabSwitcherView(tabs:CustomTab.getTabs(mov), currentTab: CustomTab.getCurrentTab(mov), movie: mov, showSeasonPicker: $showSeasonPicker, selectedSeasonIndex: $selectedSeasonIndex)
                                .padding(.horizontal, 10)
                                .padding(.top, 10)
                            
                        }
                        
                    }
                    .padding(.horizontal, 10)
                    .padding(.bottom, 30)
                }
                Spacer()
            }
            .foregroundColor(.white)
            .blur(radius: blurAmount)
            
            if showSeasonPicker {
                OpaquePickerView(selectedIndex: $selectedSeasonIndex, blurAmount: $blurAmount, picker: movie?.seasonsArray, showPicker:$showSeasonPicker)
            }
        }
        .navigationBarTitle("", displayMode: .inline)
        

        
    }
}

struct MovieDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            NavigationView {
                VStack { Text("Home")
                
                NavigationLink(
                    destination: MovieDetailView(movie: .constant(exampleMovie1))
                        ,
                    label: {
                        Text("Navigate")
                            .bold()
                            .frame(width: 280, height: 50)
                            .background(Color.blue)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                    })
                }
            }
            
            MovieDetailView(movie: .constant(exampleMovie1))
        }
        
    }
}

struct MovieInfoSubheadline: View {
    
    var movie: Movie
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("\(movie.name)")
                .font(.system(size: 20, weight: .bold))
            
            HStack(spacing: 20) {
                Image(systemName: "hand.thumbsup.fill")
                    .foregroundColor(.white)
                
                Text(String(movie.year))
                
                RatingTextView(rating: movie.rating)
                
                if (movie.episodes != nil && movie.numberOfSeasons != nil) {
                    Text(movie.numberOfSeasonsDisplay)
                }
                
                Text("HD")
                    .font(.system(size: 12))
                    .bold()
                    .padding(.horizontal, 4)
                    .padding(.vertical, 2)
                    .border(Color.gray, width: 1)
                    .foregroundColor(.white)
                    .cornerRadius(2.0)
            }
            .font(.system(size: 14))
            .foregroundColor(.gray)
            .padding(.vertical, 6)
        }
    }
}

struct RatingTextView: View {
    
    var rating : String
    
    var body: some View {
        Text(rating)
            .font(.system(size: 12))
            .bold()
            .padding(.all, 3)
            .background(Color.gray)
            .foregroundColor(.white)
            .cornerRadius(3.0)
    }
}

struct CastInfoView: View {
    
    var movie:Movie
    
    var body: some View
    {
        VStack(spacing: 3) {
            HStack {
                Text("Cast: \(movie.cast)")
                Spacer()
            }
            HStack {
                Text("Creators: \(movie.creators)")
                Spacer()
            }
        }
        .font(.caption)
        .foregroundColor(.gray)
        .padding(.vertical, 10)
    }
}

struct EpisodeInfoView: View {
    
    var movie:Movie
    
    var body: some View {
        Group {
            HStack {
                Text(movie.episodeInfoDisplay)
                    .bold()
                    .padding(.vertical, 4)
                Spacer()
            }
            HStack {
                Text(movie.episodeDescriptionDisplay)
                    .font(.subheadline)
                Spacer()
            }
        }
    }
}
