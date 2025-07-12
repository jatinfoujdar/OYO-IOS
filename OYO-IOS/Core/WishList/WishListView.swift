//
//  WishListView.swift
//  OYO-IOS
//
//  Created by jatin foujdar on 22/05/25.
//
import SwiftUI
import RiveRuntime

struct WishListView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 32) {
            VStack {
                             
                // Rive Animation
                RiveViewModel(fileName: "travel1").view()
                    
                
                // Placeholder content for empty wishlist
                VStack(spacing: 16) {
                    Text("Your wishlist is empty")
                        .font(.title2)
                        .foregroundColor(.secondary)
                    
                    Text("Start exploring and add your favorite places to your wishlist!")
                        .font(.body)
                        .foregroundColor(.secondary)
                        .multilineTextAlignment(.center)
                        .padding(.horizontal)
                }
                .padding(.top, 20)
            }
        }
        
    }
}

#Preview {
    NavigationStack {
        WishListView()
    }
}
