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
            
            HStack{
                VStack(alignment: .leading){
                    Text("Entire Villa hosted by Ram Sharma")
                        .font(.headline)
                        .frame(width: 250, alignment: .leading)
                    
                    
                    HStack{
                        Text("4 guests - ")
                        Text("4 bedroom - ")
                        Text("4 beds - ")
                        Text("3 baths ")
                    }
                    .font(.caption)
                    .fontWeight(.semibold)
                    
                }
                Spacer()
                
                Image("p1")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 64, height: 64)
                    .clipShape(Circle())
            }
            .padding()
            
            Divider()
            
            VStack(alignment: .leading, spacing: 16){
                ForEach(0..<2){feature in
                    HStack(spacing:12){
                        Image(systemName: "medal")
                        
                        VStack(alignment: .leading){
                            Text("Superhost")
                                .font(.footnote)
                                .fontWeight(.semibold)
                            
                            Text("Superhosts are experienced, highly rated, and committed to providing great stays for their guests.")
                                .font(.caption)
                                .foregroundStyle(.gray)
                        }
                    }
                }
            }
            .padding(.vertical)
        }
        .ignoresSafeArea()
    }
}

#Preview {
    ListingDetailView()
}
