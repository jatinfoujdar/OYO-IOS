//
//  ListingImageCraouselView.swift
//  OYO-IOS
//
//  Created by jatin foujdar on 19/05/25.
//

import SwiftUI

struct ListingImageCraouselView: View {
    let images = ["1", "2", "3"]
    
    var body: some View {
        
            TabView {
                ForEach(images, id: \.self) { image in
                    Image(image)
                        .resizable()
                        .scaledToFill()
                }
            }
            .tabViewStyle(.page)
        }
}

#Preview {
    ListingImageCraouselView()
}
