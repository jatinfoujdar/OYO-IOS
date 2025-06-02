//
//  ExploreViewModel.swift
//  OYO-IOS
//
//  Created by jatin foujdar on 24/05/25.
//

import Foundation

class ExploreViewModel: ObservableObject{
    @Published var listings = [ListingModel]()
    private let service: ExploreService
    
    init(service: ExploreService){
        self.service = service
        
        Task{ await fetchListing()}
    }
    
    
    
    func fetchListing() async{
        do{
            self.listings = try await service.fetchListing()
        }catch{
            print("falid to fetch listing \(error.localizedDescription)")
        }
    }
    
    
    func updateListingForLocation(_ location: String){
        let filterListings = listings.filter({
            $0.city.lowercased() == location.lowercased() ||
            $0.state.lowercased() == location.lowercased()
        })
        
        self.listings = filterListings.isEmpty ? listings : filterListings
    }
    
}
