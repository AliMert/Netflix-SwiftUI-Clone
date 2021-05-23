//
//  EpisodeView.swift
//  Netflix - Clone
//
//  Created by Ali Mert Özhayta on 13.05.2021.
//

import SwiftUI

struct EpisodeView: View {
    
    var episodes: [Episode]
    @Binding var showSeasonPicker: Bool
    @Binding var selectedSeasonIndex: Int

    func getEpisodes(forSeason season: Int) -> [Episode] {
        return episodes.filter({ $0.season == season })
    }
    
    var body: some View {
        VStack {
            // Season Picker
            HStack(spacing: 14) {
                Button(action: {
                    showSeasonPicker = true
                }, label: {
                    Group {
                        Text("Season \(selectedSeasonIndex + 1)")
                            .font(.system(size: 16))
                            .foregroundColor(.gray)
                        
                        Image(systemName: "chevron.down")
                            .font(.system(size: 12))
                    }
                    
                })
                Spacer()
            }
            
            // Episodes list
            ForEach(getEpisodes(forSeason: selectedSeasonIndex)) { episode in
                VStack(alignment: .leading) {
                    // HStack with preview image
                    HStack {
                        VideoPreviewImageView(imageURL: episode.thumbnailURL, videoURL: episode.videoURL)
                            .frame(width: 120, height: 70)
                            .clipped()
                            .cornerRadius(5.0)
                            
                        VStack(alignment: .leading) {
                            Text("\(episode.episodeNumber). \(episode.name)")
                                .font(.system(size: 16))
                                .lineLimit(2)

                            Text("\(episode.length)m")
                                .font(.system(size: 12))
                                . foregroundColor(.gray)
                        }
                        
                        Spacer()
 
                        Button(action: {
                            //
                        }, label: {
                            Image(systemName: "arrow.down.to.line.alt")  .font(.system(size: 20))
                        })
                        
                    }
                    
                    // description
                    Text(episode.description)
                        .font(.system(size: 13))
                        .lineLimit(3)
                }
                .padding(.bottom, 20)
            }
            Spacer()
        }
        .foregroundColor(.white)
        
    }
}

struct EpisodeView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.black.edgesIgnoringSafeArea(.all)
            
            EpisodeView(episodes: allExampleEpisodes, showSeasonPicker: .constant(false), selectedSeasonIndex: .constant(1))
        }
    }
}
