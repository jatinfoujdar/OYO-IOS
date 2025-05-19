import SwiftUI

struct ListingItemView: View {
    let images = ["1", "2", "3"]
    var body: some View {
    
        VStack(spacing: 8) {
            
            ListingImageCraouselView()
                .frame(height: 320)
                .clipShape(RoundedRectangle(cornerRadius: 10))
          
            HStack(alignment: .top) {
                VStack(alignment: .leading) {
                    Text("Mumbai, India")
                        .fontWeight(.semibold)
                        .foregroundStyle(.black)
                    
                    Text("12 km away")
                        .foregroundStyle(.gray)
                    
                    Text("May 18 - 21")
                        .foregroundStyle(.gray)
                    
                    HStack(spacing: 4) {
                        Text("₹567")
                            .fontWeight(.semibold)
                            .foregroundStyle(.black)
                        
                        Text("night")
                            .foregroundStyle(.black)
                    }
                }
                
                Spacer()
                
                HStack(spacing: 2) {
                    Image(systemName: "star.fill")
                    Text("4.8")
                    
                }
                .foregroundStyle(.black)
            }
            .font(.footnote)
        }
        
    }
}

#Preview {
    ListingItemView()
}
