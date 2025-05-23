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


enum ListingFeatures: Int, Codable, Identifiable, Hashable {
    var id: Int { return self.rawValue }
    
    case selfCheckIn
    case superHost
    
    var imageName: String {
        switch self {
        case .selfCheckIn:
            return "door.left.hand.open"
        case .superHost:
            return "medal"
        }
    }
    
    var title: String {
        switch self {
        case .selfCheckIn:
            return "Self Check-In"
        case .superHost:
            return "Superhost"
        }
    }
    
    var subtitle: String {
        switch self {
        case .selfCheckIn:
            return "Check yourself in with the smart lock"
        case .superHost:
            return "This host is highly rated for their hospitality"
        }
    }
}




enum ListingAmenities: Int, Identifiable, Hashable, Codable {
    var id: Int { return self.rawValue }

    case pool
    case wifi
    case kitchen
    case laundry
    case tv
    case balcony

    var title: String {
        switch self {
        case .pool:
            return "Pool"
        case .wifi:
            return "Wi-Fi"
        case .kitchen:
            return "Kitchen"
        case .laundry:
            return "Laundry"
        case .tv:
            return "TV"
        case .balcony:
            return "Balcony"
        }
    }
    
    
    var imageName: String {
        switch self {
        case .pool:
            return "figure.pool.swim"
        case .wifi:
            return "wifi"
        case .kitchen:
            return "fork.knife"
        case .laundry:
            return "washer"
        case .tv:
            return "tv"
        case .balcony:
            return "building"
        }
    }
}

