import Foundation

struct ListingModel : Identifiable, Codable{
    
    let id: String
    let ownerUId: String
    let ownerName: String
    let onwerImageUrl: String
    let numberOfBedrooms: Int
    let numberOfBathroom: Int
    let numberOfGuests: Int
    let numberOfBeds: Int
    var pricePerNight: Int
    let latitude: Double
    let longitude: Double
    let Address: String
    let city: String
    let state: String
    let title: String
    var rating: Double
    
}


enum ListingFeatures: Int, Codable, Identifiable, Hashable{
    var id: Int {return self.rawValue}
    
    case selfCheckIn
    case superHost
}

enum ListingAmenities: Int , Identifiable, Hashable, Codable{
    var id: Int {return self.rawValue}
    
    case pool
    case wifi
    case kitchen
    case laundry
    case tv
    case balcony
}
