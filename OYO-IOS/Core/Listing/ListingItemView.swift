import SwiftUI

struct ListingItemView: View {
    var body: some View {
        let images = ["1", "2", "3"]
        
        VStack(spacing: 8) {
            TabView {
                ForEach(0..<images.count, id: \.self) { index in
                    Image(images[index])
                        .resizable()
                        .scaledToFill()
                        .frame(height: 320)
                        .clipped()
                }
            }
            .frame(height: 320)
            .clipShape(RoundedRectangle(cornerRadius: 10))
            .tabViewStyle(.page)
            
            HStack(alignment: .top) {
                VStack(alignment: .leading) {
                    Text("Mumbai, India")
                        .fontWeight(.semibold)
                    
                    Text("12 km away")
                        .foregroundStyle(.gray)
                    
                    Text("May 18 - 21")
                        .foregroundStyle(.gray)
                    
                    HStack(spacing: 4) {
                        Text("₹567")
                            .fontWeight(.semibold)
                        Text("night")
                    }
                }
                
                Spacer()
                
                HStack(spacing: 2) {
                    Image(systemName: "star.fill")
                    Text("4.8")
                }
            }
            .font(.footnote)
        }
        .padding()
    }
}

#Preview {
    ListingItemView()
}
