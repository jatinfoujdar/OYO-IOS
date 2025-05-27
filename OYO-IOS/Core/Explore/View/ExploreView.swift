//
//  ExploreView.swift
//  OYO-IOS
//
//  Created by jatin foujdar on 18/05/25.
//

import SwiftUI

struct ExploreView: View {
    @State private var showDestinationSearchView = false
    @State private var viewModel = ExploreViewModel(service: ExploreService())
    
    var body: some View {
        NavigationStack{
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
                    IconScrollView()
                        .padding(.horizontal)
                    
                    LazyVStack(spacing: 35){
                        ForEach(viewModel.listings){listing in
                            NavigationLink(value: listing){
                                ListingItemView(listing: listing)
                                    .frame(height: 400)
                                    .clipShape(RoundedRectangle(cornerRadius: 10))
                            }
                        }
                    }
                    .padding()
                }
                .navigationDestination(for: Int.self){listing in
                    ListingDetailView(lisitng: DeveloperPreview.shared.listings[0])
                        .navigationBarBackButtonHidden(true)
                        .navigationBarHidden(true)
                }
            }
        }
    }
}

#Preview {
    
        ExploreView()
    
}
