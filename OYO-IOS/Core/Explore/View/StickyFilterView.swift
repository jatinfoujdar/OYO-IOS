import SwiftUI

struct StickyFilterView: View {
    @State private var selectedCategory: String? = nil
    
    private let categories = [
        "Filter", "New Listings", "Top Rated", "Luxury", "Budget", "Pet Friendly", "Family Friendly", "Near Metro"
    ]
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 12) {
                ForEach(categories, id: \.self) { category in
                    Button(action: {
                        selectedCategory = (selectedCategory == category) ? nil : category
                    }) {
                        HStack(spacing: 6) {
                            Image(systemName: iconName(for: category))
                                .resizable()
                                .scaledToFit()
                                .frame(width: 14, height: 14)
                            
                            Text(category)
                                .font(.subheadline)
                                .fontWeight(selectedCategory == category ? .semibold : .regular)
                        }
                        .padding(.vertical, 8)
                        .padding(.horizontal, 14)
                        .background(
                            selectedCategory == category ? Color.black : Color.gray.opacity(0.15)
                        )
                        .foregroundColor(selectedCategory == category ? .white : .black)
                        .clipShape(Capsule())
                    }
                }
            }
            .padding(.horizontal)
            
        }
    }
    
    private func iconName(for category: String) -> String {
        switch category {
        case "Filter": return "line.3.horizontal.decrease.circle"
        case "New Listings": return "sparkles"
        case "Top Rated": return "star.fill"
        case "Luxury": return "crown.fill"
        case "Budget": return "dollarsign.circle"
        case "Pet Friendly": return "pawprint.fill"
        case "Family Friendly": return "person.3.fill"
        case "Near Metro": return "tram.fill"
        default: return "questionmark.circle"
        }
    }
}

#Preview {
    StickyFilterView()
}
