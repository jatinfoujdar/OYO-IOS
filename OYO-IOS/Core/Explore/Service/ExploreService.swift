//
//  ExploreService.swift
//  OYO-IOS
//
//  Created by jatin foujdar on 24/05/25.
//

import Foundation

class ExploreService{
    func fetchListing() async throws ->[ListingModel]{
        return DeveloperPreview.shared.listings
    }
}
