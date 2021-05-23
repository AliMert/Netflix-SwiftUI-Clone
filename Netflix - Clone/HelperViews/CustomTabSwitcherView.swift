//
//  CustomTabSwitcherView.swift
//  Netflix - Clone
//
//  Created by Ali Mert Özhayta on 13.05.2021.
//

import SwiftUI

enum CustomTab : String {
    case episodes = "Episodes"
    case trailers = "Trailers & More"
    case more = "More Like This"
    
    static func getTabs(_ movie: Movie) -> [CustomTab] {
        if movie.episodes == nil || movie.numberOfSeasons == nil {
            return [.more]
        }
        return [.episodes, .trailers, .more]
    }
    
    static func getCurrentTab(_ movie: Movie) -> CustomTab {
        if movie.episodes == nil || movie.numberOfSeasons == nil {
            return .more
        }
        return .episodes
    }
    
}

struct CustomTabSwitcherView: View {
    var tabs : [CustomTab] = []
    @State var currentTab : CustomTab
    
    var movie : Movie
    @Binding var showSeasonPicker: Bool
    @Binding var selectedSeasonIndex: Int
    
    func widthForTab(_ tab: CustomTab) -> CGFloat {
        return tab.rawValue.widthOfString(usingFont: .systemFont(ofSize: 16, weight: .bold))
    }
    


    
    var body: some View {
        VStack(alignment: .leading) {
            
            // custom tab picker
            HStack(spacing: 15) {
                ForEach(tabs, id: \.self) { tab in
                      if self.movie.episodes != nil || tab == .more {
                            
                    VStack {
                        // Red Bar
                        Rectangle()
                            .frame(width: widthForTab(tab), height: 4)
                            .foregroundColor(tab == currentTab ? .red : .clear)
                            .cornerRadius(3.0)
                        // Button
                        Button(action: {
                            currentTab = tab
                        }, label: {
                            Text(tab.rawValue)
                                .font(.system(size: 16, weight: .bold))
                                .foregroundColor(tab == currentTab ? .white : .gray)
                        })
                        .frame(width: widthForTab(tab), height: 30)
                       
                    }
                      }
                }
                
                Spacer()
            }
            
            // Selected View
            switch currentTab {
            case .episodes:
                EpisodeView(episodes: movie.episodes ?? [], showSeasonPicker: $showSeasonPicker, selectedSeasonIndex: $selectedSeasonIndex)
                
            case .trailers:
                TrailerListView(trailers: movie.trailers)
                
            case .more:
                MoreLikeThisView(movies: movie.moreLikeThisMovies)
            }
        }
        .foregroundColor(.white)
    }
}

struct CustomTabSwitcherView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.black.edgesIgnoringSafeArea(.all)
            CustomTabSwitcherView( currentTab: CustomTab.getCurrentTab(exampleMovie1), movie: exampleMovie1, showSeasonPicker: .constant(false), selectedSeasonIndex: .constant(1))
            
        }
    }
}
