//
//  MainTabView.swift
//  OYO-IOS
//
//  Created by jatin foujdar on 22/05/25.
//

import SwiftUI

struct MainTabView: View {
    @AppStorage("selectTab") var selectTab : Tab = .chat
    var body: some View {
        ZStack{
            Group{
                switch selectTab {
                case .chat:
                    ExploreView()
                    
                case .search:
                    WishListView()
                    
                case .timer:
                    Text("User")
            
                case .bell:
                    Text("Bell")
                case .user:
            
                    ProfileView()
                }
            }
            .safeAreaInset(edge: .bottom){
                Color.clear.frame(height: 80)
            }
            
            TapBarView()
        }
     
    }
}


#Preview {
    MainTabView()
}


  
