//
//  ListingItemView.swift
//  OYO-IOS
//
//  Created by jatin foujdar on 18/05/25.
//

import SwiftUI

struct ListingItemView: View {
    var body: some View {
        VStack(spacing: 8){
            Rectangle()
                .frame(height: 320)
                .clipShape(RoundedRectangle(cornerRadius: 10))
            
            
            
            HStack(alignment: .top){
                VStack(alignment: .leading){
                    Text("Mumbai, India")
                        .fontWeight(.semibold)
                    
                    Text("12 km away")
                        .foregroundStyle(.gray)
                    
                    Text("May 18 - 21")
                        .foregroundStyle(.gray)
                    
                    HStack(spacing: 4){
                        Text("₹567")
                            .fontWeight(.semibold)
                        Text("night")
                    }
                }
                
                Spacer()
                
                HStack(spacing: 2){
                    Image(systemName: "star.fill")
                    
                    Text("4.8")
                }
            }
            .font(.footnote)
        }
    }
}

#Preview {
    ListingItemView()
}
