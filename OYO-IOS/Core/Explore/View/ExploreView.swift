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
        NavigationStack {
            if showDestinationSearchView {
                DestinationSearchView(show: $showDestinationSearchView)
            } else {
                RivePullToRefreshView(height: 200) {
                    VStack(spacing: 0) {
                        SearchFilterBarView()
                            .onTapGesture {
                                withAnimation(.snappy) {
                                    showDestinationSearchView.toggle()
                                }
                            }

                        CityTripView()
                           
                        AirbnbHomeView()
                            .padding(.vertical)
                        
                        LazyVStack(spacing: 35) {
                            ForEach(viewModel.listings) { listing in
                                NavigationLink(value: listing) {
                                    ListingItemView(listing: listing)
                                        .frame(height: 400)
                                        .clipShape(RoundedRectangle(cornerRadius: 10))
                                }
                            }
                        }
                        .padding(.top)
                        .padding(.horizontal)
                    }
                } onRefresh: {
                    // Simulate refresh delay and refetch data
                    try? await Task.sleep(nanoseconds: 3_000_000_000)

                }
                .navigationDestination(for: ListingModel.self) { listing in
                    ListingDetailView(listing: listing)
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

