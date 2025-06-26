import SwiftUI

struct TagView: View {
    let tags: [String]
    @State private var selectedTags: Set<String> = []
    @State private var totalHeight: CGFloat = .zero

    var body: some View {
        VStack {
            generateTags()
        }
        .frame(height: totalHeight)
    }

    private func generateTags() -> some View {
        GeometryReader { geometry in
            generateContent(in: geometry)
        }
    }

    private func generateContent(in geometry: GeometryProxy) -> some View {
        var width: CGFloat = 0
        var height: CGFloat = 0

        return ZStack(alignment: .topLeading) {
            ForEach(tags, id: \.self) { tag in
                tagItem(tag: tag)
                    .padding([.horizontal, .vertical], 4)
                    .alignmentGuide(.leading) { d in
                        if (abs(width - d.width) > geometry.size.width) {
                            width = 0
                            height -= d.height
                        }
                        let result = width
                        width -= d.width
                        return result
                    }
                    .alignmentGuide(.top) { _ in
                        let result = height
                        return result
                    }
            }
        }
        .background(.ultraThinMaterial)
        .background(viewHeightReader($totalHeight))
    }

    private func tagItem(tag: String) -> some View {
        let isSelected = selectedTags.contains(tag)

        return Text(tag)
            .padding(.horizontal, 12)
            .padding(.vertical, 6)
            .background(isSelected ? Color.blue : Color.white)
            .foregroundColor(isSelected ? .white : .black)
            .cornerRadius(12)
            .font(.subheadline)
            .overlay(
                RoundedRectangle(cornerRadius: 12)
                    .stroke(Color.gray.opacity(0.4), lineWidth: 1)
            )
            .onTapGesture {
                if selectedTags.contains(tag) {
                    selectedTags.remove(tag)
                } else {
                    selectedTags.insert(tag)
                }
            }
    }

    private func viewHeightReader(_ binding: Binding<CGFloat>) -> some View {
        GeometryReader { geometry in
            Color.clear
                .preference(key: ViewHeightKey.self, value: geometry.size.height)
        }
        .onPreferenceChange(ViewHeightKey.self) { value in
            binding.wrappedValue = value
        }
    }
}

private struct ViewHeightKey: PreferenceKey {
    static var defaultValue: CGFloat = 0
    static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {
        value = nextValue()
    }
}

// MARK: - Preview

#Preview {
    let tags = [
        "João Pessoa",
        "Tromsø",
        "Sanya",
        "Trieste",
        "San Pedro de Atacama",
        "Houston",
        "Naha",
        "Villajoyosa",
        "Tignes",
        "Willemstad",
        "Koh Samui",
        "São Paulo",
        "Franschhoek",
        "Moab",
        "Paros"
    ]

    TagView(tags: tags)
}
