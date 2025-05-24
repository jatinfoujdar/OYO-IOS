import SwiftUI

struct ListingItemView: View {
    let listing: ListingModel
    var body: some View {
    
        VStack(spacing: 8) {
            
            ListingImageCraouselView()
                .frame(height: 320)
                .clipShape(RoundedRectangle(cornerRadius: 10))
          
            HStack(alignment: .top) {
                VStack(alignment: .leading) {
                    Text("\(listing.city), \(listing.state)")
                        .fontWeight(.semibold)
                        .foregroundStyle(.black)
                    
                    Text(listing.address)
                        .foregroundStyle(.gray)
                    
                    Text("May 18 - 21")
                        .foregroundStyle(.gray)
                    
                    HStack(spacing: 4) {
                        Text("₹\(listing.pricePerNight)")
                            .fontWeight(.semibold)
                            .foregroundStyle(.black)
                        
                        Text("night")
                            .foregroundStyle(.black)
                    }
                }
                
                Spacer()
                
                HStack(spacing: 2) {
                    Image(systemName: "star.fill")
                    Text("\(String(format: "%g", listing.rating))")

                    
                }
                .foregroundStyle(.black)
            }
            .font(.footnote)
        }
        
    }
}

#Preview {
    ListingItemView(listing: DeveloperPreview.shared.listings[1])
}
