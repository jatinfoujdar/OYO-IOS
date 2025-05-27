import SwiftUI

struct AirbnbHomeView: View {
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(alignment: .leading, spacing: 20) {
         

                // MARK: - Airbnb Originals Header
                HStack {
                    Text("Airbnb Originals")
                        .font(.title2)
                        .fontWeight(.semibold)
                    Image(systemName: "chevron.right")
                        .font(.caption)
                }
                .padding(.horizontal)

                // MARK: - Airbnb Originals Horizontal Scroll
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 15) {
                        AirbnbOriginalCard(
                            imageName: "luchador", // Replace with your image asset
                            title: "Get in the ring with a real Mexican luchador",
                            price: "From $235 / guest"
                        )
                        AirbnbOriginalCard(
                            imageName: "cooking", // Replace with your image asset
                            title: "Cook with heirloom corn at Tamales Madre",
                            price: "From $60 / guest",
                            rating: 5.0
                        )
                        // Add more AirbnbOriginalCard instances as needed
                    }
                    .padding(.horizontal) // Padding for the scrollable content
                }

                Spacer() // Pushes content to the top if needed
            }
        }
    }
}



// MARK: - AirbnbOriginalCard View
struct AirbnbOriginalCard: View {
    let imageName: String
    let title: String
    let price: String
    var rating: Double? = nil

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            ZStack(alignment: .topTrailing) {
                Image("2")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 180, height: 200) // Adjust size as needed
                    .cornerRadius(10)
                    .clipped() // Ensure content doesn't spill out of bounds

           

                // Heart icon
                Image(systemName: "heart.fill") // Use "heart" for outline
                    .font(.title3)
                    .foregroundColor(.white)
                    .shadow(radius: 2)
                    .padding(8)
                    .offset(x: -5, y: 5) // Adjust position
            }

            Text(title)
                .font(.subheadline)
                .fontWeight(.medium)
                .lineLimit(2) // Limit text to two lines if it's long
                .fixedSize(horizontal: false, vertical: true) // Allow vertical expansion

            HStack {
                Text(price)
                    .font(.footnote)
                    .fontWeight(.semibold)

                if let rating = rating {
                    Image(systemName: "star.fill")
                        .font(.caption2)
                        .foregroundColor(.yellow)
                    Text(String(format: "%.1f", rating))
                        .font(.caption2)
                        .foregroundColor(.gray)
                }
            }
        }
        .frame(width: 180) // Maintain a consistent width for the cards
        .background(Color.white) // Optional: add a background to the card itself if needed
    }
}

// MARK: - Preview Provider
struct AirbnbHomeView_Previews: PreviewProvider {
    static var previews: some View {
        AirbnbHomeView()
    }
}
