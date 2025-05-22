//
//  MainTabView.swift
//  OYO-IOS
//
//  Created by jatin foujdar on 22/05/25.
//

import SwiftUI

struct MainTabView: View {
    var body: some View {
        TabView{
            ExploreView()
                .tabItem{Label("Explore", systemImage: "magnifyingglass")}
            
            WishListView()
                .tabItem{Label("Wishlists", systemImage: "heart")}
            
            ProfileView()
                .tabItem{Label("Profile", systemImage: "person.circle")}
        }
    }
}

#Preview {
    MainTabView()
}
