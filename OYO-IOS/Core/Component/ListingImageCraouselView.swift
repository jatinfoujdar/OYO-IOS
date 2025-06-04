import SwiftUI

struct ListingImageCarouselView: View {
    
    var body: some View {
        let images = ["1", "2", "3"]
        
        TabView {
            ForEach(images, id: \.self) { image in
                ZStack(alignment: .topTrailing) {
                    // Main image
                    Image(image)
                        .resizable()
                        .scaledToFill()
                        .frame(height: 300)
                        .clipped()
                    
                    // Heart icon in top-right corner
                    Image(systemName: "heart.fill") // Use "heart" for outlined version
                        .font(.title)
                        .foregroundColor(.white)
                        .padding(.horizontal,30)
                        .padding()
                }
                .frame(height: 300)
                .cornerRadius(10)
                .padding(.horizontal)
            }
        }
        .tabViewStyle(.page)
    }
}

#Preview {
    ListingImageCarouselView()
}
