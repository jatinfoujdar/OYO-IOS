//
//  ExploreView.swift
//  OYO-IOS
//
//  Created by jatin foujdar on 18/05/25.
//

import SwiftUI

struct ExploreView: View {
    @State private var showDestinationSearchView = false
    var body: some View {
        if showDestinationSearchView{
            DestinationSearchView(show: $showDestinationSearchView)
        }else{
            ScrollView{
                SearchFilterBarView()
                    .onTapGesture {
                        withAnimation(.snappy){
                            showDestinationSearchView.toggle()
                        }
                    }
                LazyVStack(spacing: 35){
                    ForEach(0 ... 10, id: \.self){listing in
                        NavigationLink(value: listing){
                            ListingItemView()
                                .frame(height: 400)
                                .clipShape(RoundedRectangle(cornerRadius: 10))
                        }
                    }
                }
                .padding()
            }
            .navigationDestination(for: Int.self){listing in
                ListingDetailView()
                    .navigationBarBackButtonHidden(true)
                    .navigationBarHidden(true)
            }
        }
    }
}

#Preview {
    NavigationStack{
        ExploreView()
    }
}
