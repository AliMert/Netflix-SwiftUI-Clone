//
//  HomeTabView.swift
//  Netflix - Clone
//
//  Created by Ali Mert Özhayta on 16.05.2021.
//

import SwiftUI

enum HomeTabItem: Int, CaseIterable {
    
    case home = 0
    case search = 1
    case comingSoon = 2
    case downloads = 3
    case more = 4
    
    var stringValue: String {
        return String(describing: self)
            .capitalizeFirstLetter()
            .addSpaceBeforeUppercaseLetter()
    }
}

struct HomeTabView: View {
    
    @State private var currentTab = 0
    
    init() {
        UITabBar.appearance().barTintColor = .black
        UINavigationBar.appearance().barTintColor = .black
        //        UITabBar.appearance().isTranslucent = false
    }
    
    var body: some View {
        NavigationView {
            TabView(selection: $currentTab) {
                HomeView()
                    .navigationBarTitle("")
                    .navigationBarHidden(true)
                    
                    .tabItem {
                        Label(HomeTabItem.home.stringValue, systemImage: "house")
                    }
                    .tag(HomeTabItem.home.rawValue)
                
                Text(HomeTabItem.search.stringValue)
                    .tabItem {
                        Label(HomeTabItem.search.stringValue, systemImage: "magnifyingglass")
                    }
                    .tag(HomeTabItem.search.rawValue)
                
                Text(HomeTabItem.comingSoon.stringValue)
                    .tabItem {
                        Label(HomeTabItem.comingSoon.stringValue, systemImage: "play.rectangle")
                    }
                    .tag(HomeTabItem.comingSoon.rawValue)
                
                Text(HomeTabItem.downloads.stringValue)
                    .tabItem {
                        Label(HomeTabItem.downloads.stringValue, systemImage: "arrow.down.to.line.alt")
                    }
                    .tag(HomeTabItem.downloads.rawValue)
                
                
                Text(HomeTabItem.more.stringValue)
                    .tabItem {
                        Label(HomeTabItem.more.stringValue, systemImage: "list.dash")
                    }
                    .tag(HomeTabItem.more.rawValue)
            }
            
            //            ForEach(HomeTabItem.allCases, id: \.self) { homeTabItem in
            //                switch homeTabItem {
            //                case .home:
            //                    HomeView()
            //                        .tabItem {
            //                            Image(systemName: "house")
            //                            Text(homeTabItem.stringValue)
            //                        }.tag(homeTabItem.rawValue)
            //
            //                case .search:
            //                    Text(homeTabItem.stringValue)
            //                        .tabItem {
            //                            Image(systemName: "magnifyingglass")
            //                            Text(homeTabItem.stringValue)
            //                        }.tag(homeTabItem.rawValue)
            //
            //                case .comingSoon:
            //                    Text(homeTabItem.stringValue)
            //                        .tabItem {
            //                            Image(systemName: "play.rectangle")
            //                            Text("coming Soon").font(.system(size: 4))
            //
            //                        }.tag(homeTabItem.rawValue)
            //
            //                case .downloads:
            //                    Text(homeTabItem.stringValue)
            //                        .tabItem {
            //                            Image(systemName: "arrow.down.to.line.alt")
            //                            Text(homeTabItem.stringValue)
            //                        }.tag(homeTabItem.rawValue)
            //
            //                case .more:
            //                    Text(homeTabItem.stringValue)
            //                        .tabItem {
            //                            Image(systemName: "equal")
            //                            Text(homeTabItem.stringValue)
            //                        }.tag(homeTabItem.rawValue)
            //                }
            //
            //            }
        }
        .edgesIgnoringSafeArea(.top)
        .accentColor(.white)
    }
}

struct HomeTabView_Previews: PreviewProvider {
    static var previews: some View {
        HomeTabView()
        
    }
}
