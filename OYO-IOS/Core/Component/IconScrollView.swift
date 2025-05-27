//
//  IconScrollView.swift
//  OYO-IOS
//
//  Created by jatin foujdar on 27/05/25.
//
import SwiftUI

struct IconScrollView: View {
    let icons: [(image: String, label: String)] = [
        ("12", "Home"),
        ("22", "Experience"),
        ("23", "Service"),
        ("55", "Flight"),
        ("7", "Spa Treatments"),
        ("9", "Massage"),
        ("10", "Catering"),
        ("17", "Exercise"),
        ("25", "Photography"),
        ("26", "Relax"),
      
    ]

    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 26) {
                ForEach(icons, id: \.image) { icon in
                    VStack {
                        Image(icon.image)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 80, height: 80)
                        Text(icon.label)
                            .font(.footnote)
                            .fontWeight(.bold)
                            .multilineTextAlignment(.center)
                    }
                    
                }
            }
            .padding()
        }
    }
}

#Preview {
    IconScrollView()
}
