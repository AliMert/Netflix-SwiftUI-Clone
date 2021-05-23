//
//  HomeView.swift
//  Netflix - Clone
//
//  Created by Ali Mert Özhayta on 9.05.2021.
//

import SwiftUI

struct HomeView: View {
    
    @ObservedObject private var homeViewModel = HomeViewModel.shared
    
    @State private var topRowSelection: HomeTopRow = .home
    @State private var homeGenre: HomeGenre = .AllGenres
    
    @State private var showGenreSelection: Bool = false
    @State private var showTopRowSelection: Bool = false
    @State private var blurAmount: CGFloat = 0
    
    let screen: CGRect = UIScreen.main.bounds
    
    var body: some View {
        // main VStack
        ZStack {
            Color.black.edgesIgnoringSafeArea(.all)
                            
            ScrollView(showsIndicators: false) {
                LazyVStack {
                    ZStack(alignment: .top) {
                        TopRowButtons(topRowSelection: $topRowSelection, homeGenre: $homeGenre, showCategorySelection: $showGenreSelection, showTopRowSelection: $showTopRowSelection)
                        
                        TopMoviePreview()
                            .frame(width: screen.width)
                            .zIndex(-1)
                    }
                }
                
                HomeStack(topRowSelection: $topRowSelection, selectedGenre: $homeGenre)
            }
            .clipped()
            .edgesIgnoringSafeArea(.top)
            .blur(radius: blurAmount)
            
            if showTopRowSelection {
                OpaquePickerView(
                    selectedIndex: .constant(HomeTopRow.getSelectedRowIndex(selectedRow: topRowSelection)),
                    blurAmount: $blurAmount,
                    picker: HomeTopRow.toArray(),
                    showPicker: $showTopRowSelection) { index in
                    let selected = HomeTopRow.toArray()[index]
                    topRowSelection = HomeTopRow.getHomeTopRowFrom(value: selected)
                    
                }
            }
            
            if showGenreSelection {
                OpaquePickerView(
                    selectedIndex: .constant(HomeGenre.getHomeGenreIndex(genre: homeGenre)),
                    blurAmount: $blurAmount,
                    picker: HomeGenre.toArray(),
                    showPicker: $showGenreSelection) { index in
                    let selected = HomeGenre.toArray()[index]
                    homeGenre = HomeGenre.getGenreFrom(value: selected)
                    
                }
            }
            
        }
            .foregroundColor(.white)
        
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

enum HomeGenre : String, CaseIterable {
    case AllGenres = "All Categories"
    case Action
    case Anime
    case ChildrenAndFamily = "Children & Family"
    case Classics
    case Comedy
    case Crime
    case Documentaries
    case Drama
    case Horror
    case LGBTQ
    case Romance
    case SciFi = "Sci-Fi"
    case Sports
    case Thriller
    
    static func toArray() -> [String] {
        var array : [String] = []
        for row in HomeGenre.allCases {
            array.append(row.rawValue)
        }
        return array
    }
    
    static func getHomeGenreIndex(genre: HomeGenre) -> Int {
        
        let array = HomeGenre.toArray()
        
        for index in 0..<array.count {
            if genre.rawValue == array[index] {
                return index
            }
        }
        
        return 0
    }
    
    static func getGenreFrom(value: String) -> HomeGenre {
        for row in HomeGenre.allCases {
            if row.rawValue == value {
                return row
            }
        }
        return .AllGenres
    }
}


