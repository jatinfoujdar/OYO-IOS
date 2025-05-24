//
//  ExploreViewModel.swift
//  OYO-IOS
//
//  Created by jatin foujdar on 24/05/25.
//

import Foundation

class ExploreViewModel: ObservableObject{
    @Published var listings = [ListingModel]()
    
    init(){
        
    }
    
    func fetchListing() async{
        
    }
}
