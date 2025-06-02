//
//  ExploreViewModel.swift
//  OYO-IOS
//
//  Created by jatin foujdar on 24/05/25.
//

import Foundation

class ExploreViewModel: ObservableObject{
    @Published var listings = [ListingModel]()
    @Published var searchLocation: String = ""
    private let service: ExploreService
    private var listingCopy = [ListingModel]()
    
    init(service: ExploreService){
        self.service = service
        
        Task{ await fetchListing()}
    }
    
    
    
    func fetchListing() async{
        do{
            self.listings = try await service.fetchListing()
            self.listingCopy = listings
        }catch{
            print("falid to fetch listing \(error.localizedDescription)")
        }
    }
    
    
    func updateListingForLocation(){
        let filterListings = listings.filter({
            $0.city.lowercased() == searchLocation.lowercased() ||
            $0.state.lowercased() == searchLocation.lowercased()
        })
        
        self.listings = filterListings.isEmpty ? listingCopy : filterListings
    }
    
}
