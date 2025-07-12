//
//  MainTabView.swift
//  OYO-IOS
//
//  Created by jatin foujdar on 22/05/25.
//
import SwiftUI

struct MainTabView: View {
    @AppStorage("selectTab") var selectTab: Tab = .chat
    
   
    var body: some View {
        ZStack {
            TabView(selection: $selectTab) {
                ExploreView()
                    .tag(Tab.chat)
                WishListView()
                    .tag(Tab.search)
                GlassmorphismView()
                    .tag(Tab.timer)
                Text("Bell")
                    .tag(Tab.bell)
                ProfileView()
                    .tag(Tab.user)
            }
            .tabViewStyle(.page(indexDisplayMode: .never))
            .animation(.easeInOut, value: selectTab)
            .safeAreaInset(edge: .bottom) {
                Color.clear.frame(height: 80)
            }

            TapBarView()
        }
    }
}



#Preview {
    MainTabView()
}


  
