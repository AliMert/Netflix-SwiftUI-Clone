//
//  TopRowButtons.swift
//  Netflix - Clone
//
//  Created by Ali Mert Özhayta on 11.05.2021.
//

import SwiftUI

struct TopRowButtons: View {
    
    @Binding var topRowSelection: HomeTopRow
    @Binding var homeGenre: HomeGenre

    @Binding var showCategorySelection: Bool
    @Binding var showTopRowSelection: Bool
    
    
    
    var body: some View {
        switch topRowSelection {
        case .home:
            VStack {
                HStack {
                    Button(action: {
                        topRowSelection = .home
                    }, label: {
                        Image("netflix_logo")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 40)
                    })
                    
                    Spacer()
                }
                .padding(.leading, 10)
                .padding(.bottom, 5)
                .padding(.top, 50)
                
                HStack {
                    Spacer()

                    Button(action: {
                        topRowSelection = .tvShows
                    }, label: {
                        Text("TV Shows")
                            .font(.callout)
                    })
                    Spacer()
                    Button(action: {
                        topRowSelection = .movies
                    }, label: {
                        Text("Movies")
                            .font(.callout)
                    })
                    Spacer()
                    Button(action: {
                        topRowSelection = .myList
                    }, label: {
                        Text("My List")
                            .font(.callout)
                    })
                    .padding(.trailing, 30)
                }
                .foregroundColor(.white)
                
                
                Spacer()
                
            }
            .frame(height: 200)
            .background(LinearGradient.blackOpacityGradientReverse)
            
        case .tvShows, .movies:
            VStack {
                HStack {
                    Button(action: {
                        topRowSelection = .home
                    }, label: {
                        Image("netflix_logo")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 40)
                    })
                    
                    Spacer()
                }
                .padding(.leading, 10)
                .padding(.bottom, 5)
                .padding(.top, 50)
                
                HStack(spacing: 20) {
                    
                    Button(action: {
                        showTopRowSelection = true
                    }, label: {
                        Text(topRowSelection.rawValue)
                            .font(.callout)
                        
                        Image(systemName: "triangle.fill")
                            .font(.system(size: 6))
                            .rotationEffect(.degrees(180), anchor: .center)
                            .scaleEffect(x: 1.5)
                    })

                    Button(action: {
                        showCategorySelection = true
                    }, label: {
                        Text(homeGenre.rawValue)
                            .font(.caption)
                        
                        Image(systemName: "triangle.fill")
                            .font(.system(size: 5))
                            .rotationEffect(.degrees(180), anchor: .center)
                            .scaleEffect(x: 1.5)
                    })
                    
                    Spacer()
                }
                .padding(.leading, 30)
                .foregroundColor(.white)
                
                
                Spacer()
                
            }
            .frame(height: 200)
            .background(LinearGradient.blackOpacityGradientReverse)
            
    case .myList:
            Text("TEST123").foregroundColor(.blue)

    }
        
           
        
    }
    
    struct TopRowButtons_Previews: PreviewProvider {
        static var previews: some View {
            ZStack(alignment: .top) {
                Color.gray
                
                TopRowButtons(topRowSelection: .constant(.movies), homeGenre: .constant(.AllGenres), showCategorySelection: .constant(false), showTopRowSelection: .constant(false))
            }
            .edgesIgnoringSafeArea(.all)
        }
    }
}


enum HomeTopRow: String, CaseIterable {
    case home = "Home"
    case tvShows = "TV Shows"
    case movies = "Movies"
    case myList = "My List"
    
    static func toArray() -> [String] {
        var array : [String] = []
        for row in HomeTopRow.allCases {
            array.append(row.rawValue)
        }
        return array
    }
    
    static func getSelectedRowIndex(selectedRow: HomeTopRow) -> Int {
        
        let array = HomeTopRow.toArray()
        
        for index in 0..<array.count {
            if selectedRow.rawValue == array[index] {
                return index
            }
        }
        return 0
    }
    
    static func getHomeTopRowFrom(value: String) -> HomeTopRow {
        for row in HomeTopRow.allCases {
            if row.rawValue == value {
                return row
            }
        }
        return .home
    }
}
