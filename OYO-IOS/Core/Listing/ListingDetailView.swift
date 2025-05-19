//
//  ListingDetailView.swift
//  OYO-IOS
//
//  Created by jatin foujdar on 19/05/25.
//

import SwiftUI

struct ListingDetailView: View {
    
    var body: some View {
        ScrollView{
            ListingImageCraouselView()
                .frame(height: 320)
                
            VStack(alignment: .leading){
                Text("Mumbai Villa")
                    .font(.title)
                    .fontWeight(.semibold)
                
                VStack(alignment: .leading){
                    HStack(spacing: 2){
                        Image(systemName: "star.fill")
                        Text("4.8")
                        
                        Text(" - ")
                        
                        Text("32 reviews")
                            .font(.subheadline)
                            .fontWeight(.semibold)
                            .underline()
                        
                    }
                    .foregroundStyle(.black)
                    
                    Text("Mumbai , Maharashtra")
                }
                .font(.caption)
            }
            .padding(.leading)
            .frame(maxWidth: .infinity, alignment: .leading)
            
            Divider()
            
            
        }
        .ignoresSafeArea()
    }
}

#Preview {
    ListingDetailView()
}
