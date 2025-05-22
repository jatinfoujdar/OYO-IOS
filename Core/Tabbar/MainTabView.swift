struct MainTabView: View {
    var body: some View {
        NavigationStack {
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
} 