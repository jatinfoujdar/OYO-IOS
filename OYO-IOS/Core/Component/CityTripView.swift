//
//  CityTripView.swift
//  OYO-IOS
//
//  Created by jatin foujdar on 27/05/25.
//

import SwiftUI

struct CityTripView: View {
    var body: some View {
        HStack(alignment: .center) {
            VStack(alignment: .leading) {
                Text("View details of your")
                    .font(.headline)
                    .foregroundColor(.primary)
                Text("Mumbai City trip")
                    .font(.title3)
                    .fontWeight(.bold)
                    .foregroundColor(.primary)
                HStack {
                    Text("May 22 – 26")
                    Text("•")
                    Text("3 guests")
                    Image(systemName: "chevron.right")
                        .font(.caption)
                }
                .font(.subheadline)
                .foregroundColor(.gray)
            }
            .padding(.horizontal,10)
            // Calendar Image (You'll need an asset for this)
            Image("77") // Replace with your actual asset name
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 100, height: 100) // Adjust size as needed
                .overlay(
                    Text("STARTS IN\n7 DAYS") // This text might be part of the image asset or overlaid
                        .font(.caption2)
                        .fontWeight(.bold)
                        .multilineTextAlignment(.center)
                        .foregroundColor(.white)
                        .offset(y: -10) // Adjust position
                )
        }
        .padding()
        .background(Color.white) // Or a subtle off-white
        .cornerRadius(15)
        .shadow(color: Color.gray.opacity(0.2), radius: 5, x: 0, y: 2)
    }
}


#Preview {
    CityTripView()
}
